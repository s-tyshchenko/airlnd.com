<?php

class Response
{
    private $headers = array();
    private $level = 0;
    private $output;

    public function addHeader($header)
    {
        $this->headers[] = $header;
    }

    public function redirect($url, $status = 302)
    {
        header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url), true, $status);
        exit();
    }

    public function setCompression($level)
    {
        $this->level = $level;
    }

    public function getOutput()
    {
        return $this->output;
    }

    public function setOutput($output)
    {
        $this->output = $output;
    }

    private function compress($data, $level = 0)
    {
        if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false)) {
            $encoding = 'gzip';
        }

        if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false)) {
            $encoding = 'x-gzip';
        }

        if (!isset($encoding) || ($level < -1 || $level > 9)) {
            return $data;
        }

        if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
            return $data;
        }

        if (headers_sent()) {
            return $data;
        }

        if (connection_status()) {
            return $data;
        }

        $this->addHeader('Content-Encoding: ' . $encoding);

        return gzencode($data, (int)$level);
    }

    public function output()
    {
        if ($this->output) {
            $this->webpRebuild();

            $output = $this->level ? $this->compress($this->output, $this->level) : $this->output;
            if (!headers_sent()) {
                foreach ($this->headers as $header) {
                    header($header, true);
                }
            }
            echo $output;
        }
    }

    public function webpRebuild()
    {
        $gd = gd_info();

        if ($gd['WebP Support']) {
            $uri = '';

            if (isset($_SERVER['REQUEST_URI'])) {
                $uri = $_SERVER['REQUEST_URI'];
            }

            if (stripos($uri, 'admin') === false) {
                if (isset($_SERVER['HTTP_ACCEPT']) && isset($_SERVER['HTTP_USER_AGENT'])) {
                    if (strpos($_SERVER['HTTP_ACCEPT'], 'image/webp') !== false) {
                        $re = '/(cache)(\/.*)(\.jpg|\.png|\.jpeg)/U';
                        $subst = '$1webp$2.webp';
                        $this->output = preg_replace($re, $subst, $this->output);
                    }
                }
            }
        }
    }
}
