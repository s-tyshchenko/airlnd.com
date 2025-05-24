<?php
/**
 * OpenCart Local Development Server
 * 
 * This script launches PHP's built-in web server for OpenCart development
 * Usage: php serve.php [port] [host]
 */

// Default settings
$host = isset($argv[2]) ? $argv[2] : 'localhost';
$port = isset($argv[1]) ? (int)$argv[1] : 8000;
$root = __DIR__;

// Create config files if they don't exist
checkAndCreateConfig();

// Display startup message
echo "Starting OpenCart development server...\n";
echo "Server running at: http://{$host}:{$port}\n";
echo "Document root: {$root}\n";
echo "Press Ctrl+C to stop the server\n\n";

// Start the server
$command = "php -S {$host}:{$port} -t {$root} {$root}/server.php";
system($command);

/**
 * Check and create necessary config files if they don't exist
 */
function checkAndCreateConfig() {
    $projectDir = __DIR__;
    
    // Check for admin config
    if (!file_exists($projectDir . '/admin/config.php') && file_exists($projectDir . '/config.php.example')) {
        echo "Creating admin config file...\n";
        
        $adminConfig = '<?php' . PHP_EOL;
        $adminConfig .= '// HTTP' . PHP_EOL;
        $adminConfig .= 'define(\'HTTP_SERVER\', \'http://localhost:8000/admin/\');' . PHP_EOL;
        $adminConfig .= 'define(\'HTTP_CATALOG\', \'http://localhost:8000/\');' . PHP_EOL;
        $adminConfig .= '' . PHP_EOL;
        $adminConfig .= '// HTTPS' . PHP_EOL;
        $adminConfig .= 'define(\'HTTPS_SERVER\', \'http://localhost:8000/admin/\');' . PHP_EOL;
        $adminConfig .= 'define(\'HTTPS_CATALOG\', \'http://localhost:8000/\');' . PHP_EOL;
        $adminConfig .= '' . PHP_EOL;
        $adminConfig .= '// DIR' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_APPLICATION\', \'' . $projectDir . '/admin/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_SYSTEM\', \'' . $projectDir . '/system/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_IMAGE\', \'' . $projectDir . '/image/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_STORAGE\', \'' . $projectDir . '/system/storage/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_CATALOG\', \'' . $projectDir . '/catalog/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_LANGUAGE\', \'' . $projectDir . '/admin/language/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_TEMPLATE\', \'' . $projectDir . '/admin/view/template/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_CONFIG\', \'' . $projectDir . '/system/config/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_CACHE\', \'' . $projectDir . '/system/storage/cache/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_DOWNLOAD\', \'' . $projectDir . '/system/storage/download/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_LOGS\', \'' . $projectDir . '/system/storage/logs/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_MODIFICATION\', \'' . $projectDir . '/system/storage/modification/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_SESSION\', \'' . $projectDir . '/system/storage/session/\');' . PHP_EOL;
        $adminConfig .= 'define(\'DIR_UPLOAD\', \'' . $projectDir . '/system/storage/upload/\');' . PHP_EOL;
        $adminConfig .= '' . PHP_EOL;
        $adminConfig .= '// DB' . PHP_EOL;
        $adminConfig .= 'define(\'DB_DRIVER\', \'mysqli\');' . PHP_EOL;
        $adminConfig .= 'define(\'DB_HOSTNAME\', \'localhost\');' . PHP_EOL;
        $adminConfig .= 'define(\'DB_USERNAME\', \'root\');' . PHP_EOL;
        $adminConfig .= 'define(\'DB_PASSWORD\', \'\');' . PHP_EOL;
        $adminConfig .= 'define(\'DB_DATABASE\', \'opencart\');' . PHP_EOL;
        $adminConfig .= 'define(\'DB_PORT\', \'3306\');' . PHP_EOL;
        $adminConfig .= 'define(\'DB_PREFIX\', \'oc_\');' . PHP_EOL;
        
        file_put_contents($projectDir . '/admin/config.php', $adminConfig);
    }
    
    // Check for catalog config
    if (!file_exists($projectDir . '/config.php') && file_exists($projectDir . '/config.php.example')) {
        echo "Creating catalog config file...\n";
        
        $config = '<?php' . PHP_EOL;
        $config .= '// HTTP' . PHP_EOL;
        $config .= 'define(\'HTTP_SERVER\', \'http://localhost:8000/\');' . PHP_EOL;
        $config .= '' . PHP_EOL;
        $config .= '// HTTPS' . PHP_EOL;
        $config .= 'define(\'HTTPS_SERVER\', \'http://localhost:8000/\');' . PHP_EOL;
        $config .= '' . PHP_EOL;
        $config .= '// DIR' . PHP_EOL;
        $config .= 'define(\'DIR_APPLICATION\', \'' . $projectDir . '/catalog/\');' . PHP_EOL;
        $config .= 'define(\'DIR_SYSTEM\', \'' . $projectDir . '/system/\');' . PHP_EOL;
        $config .= 'define(\'DIR_IMAGE\', \'' . $projectDir . '/image/\');' . PHP_EOL;
        $config .= 'define(\'DIR_STORAGE\', \'' . $projectDir . '/system/storage/\');' . PHP_EOL;
        $config .= 'define(\'DIR_LANGUAGE\', \'' . $projectDir . '/catalog/language/\');' . PHP_EOL;
        $config .= 'define(\'DIR_TEMPLATE\', \'' . $projectDir . '/catalog/view/theme/\');' . PHP_EOL;
        $config .= 'define(\'DIR_CONFIG\', \'' . $projectDir . '/system/config/\');' . PHP_EOL;
        $config .= 'define(\'DIR_CACHE\', \'' . $projectDir . '/system/storage/cache/\');' . PHP_EOL;
        $config .= 'define(\'DIR_DOWNLOAD\', \'' . $projectDir . '/system/storage/download/\');' . PHP_EOL;
        $config .= 'define(\'DIR_LOGS\', \'' . $projectDir . '/system/storage/logs/\');' . PHP_EOL;
        $config .= 'define(\'DIR_MODIFICATION\', \'' . $projectDir . '/system/storage/modification/\');' . PHP_EOL;
        $config .= 'define(\'DIR_SESSION\', \'' . $projectDir . '/system/storage/session/\');' . PHP_EOL;
        $config .= 'define(\'DIR_UPLOAD\', \'' . $projectDir . '/system/storage/upload/\');' . PHP_EOL;
        $config .= '' . PHP_EOL;
        $config .= '// DB' . PHP_EOL;
        $config .= 'define(\'DB_DRIVER\', \'mysqli\');' . PHP_EOL;
        $config .= 'define(\'DB_HOSTNAME\', \'localhost\');' . PHP_EOL;
        $config .= 'define(\'DB_USERNAME\', \'root\');' . PHP_EOL;
        $config .= 'define(\'DB_PASSWORD\', \'\');' . PHP_EOL;
        $config .= 'define(\'DB_DATABASE\', \'opencart\');' . PHP_EOL;
        $config .= 'define(\'DB_PORT\', \'3306\');' . PHP_EOL;
        $config .= 'define(\'DB_PREFIX\', \'oc_\');' . PHP_EOL;
        
        file_put_contents($projectDir . '/config.php', $config);
    }
    
    // Ensure system/storage directory exists and is writable
    $storageDir = $projectDir . '/system/storage';
    if (!is_dir($storageDir)) {
        mkdir($storageDir, 0755, true);
        
        // Create necessary subdirectories
        $dirs = ['cache', 'download', 'logs', 'modification', 'session', 'upload'];
        foreach ($dirs as $dir) {
            if (!is_dir($storageDir . '/' . $dir)) {
                mkdir($storageDir . '/' . $dir, 0755, true);
            }
        }
    }
}
