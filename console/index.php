<?php

//error_reporting(E_ALL);

if (php_sapi_name() != 'cli') {
    die("command: php console/index.php");
}

chdir(dirname(__FILE__));

if (isset($argv)) {
    foreach ($argv as $arg) {
        parse_str($arg, $args);
        $_GET = array_merge($_GET, $args);
    }
    unset($_GET['index_php']);
}

if (is_file('config.php')) {
    require_once('config.php');
}else{
    die("invalid config");
}

require_once('startup.php');
start('console');