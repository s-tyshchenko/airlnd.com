<?php

use Predis\Client;

class DBCache
{
    private static $instance;
    private $redis;

    const DEFAULT_CACHE_TTL_SECONDS = 3600;

    public static function getInstance()
    {
        if (null === static::$instance) {
            static::$instance = new static();
        }
        return static::$instance;
    }

    protected function __construct()
    {
        if (CACHE_PORT) {
            $params = [
                'scheme' => 'tcp',
                'host'   => CACHE_HOSTNAME,
                'port'   => CACHE_PORT,
            ];
        } else {
            $params = [
                'scheme' => 'unix',
                'path' => CACHE_HOSTNAME
            ];
        }

        $this->redis = new Client($params);
    }

    public function clear()
    {
        $this->redis->flushall();
    }

    public function addCacheEntry($queryText, $fetchData, $options = [])
    {
        if (!(isset($options['ttl']) && $ttl = $options['ttl'])) {
            $ttl = self::DEFAULT_CACHE_TTL_SECONDS;
        }

        $this->redis->set($queryText, serialize($fetchData));
        $this->redis->expire($queryText, $ttl);
    }

    public function getCacheEntry($queryText)
    {
        if ($cachedEntry = $this->redis->get($queryText)) {
            return unserialize($cachedEntry);
        }

        return null;
    }

    public static function isModificationQuery($queryText)
    {
        $readQueries = array('select', 'show tables', 'show columns');
        foreach ($readQueries as $readQuery) {
            if (stripos(trim($queryText), $readQuery) == 0) {
                return false;
            }
        }

        return true;
    }

    public static function processDbQuery($db, $sql, $params = [])
    {
        $dbCache = DBCache::getInstance();

        if (!DBCache::isModificationQuery($sql)) {
            $cachedFetch = $dbCache->getCacheEntry($sql);
            if ($cachedFetch != null) {
                return $cachedFetch;
            }
        }

        $freshDbFetch = $db->query($sql);

        if (!DBCache::isModificationQuery($sql)) {
            $dbCache->addCacheEntry($sql, $freshDbFetch, $params);
        }

        return $freshDbFetch;
    }
}
