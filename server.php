<?php
/**
 * Router script for OpenCart with PHP's built-in web server
 * 
 * This file helps the built-in PHP server handle OpenCart's URL structure
 */

// Define the document root
$docRoot = __DIR__;

// Get the requested URI
$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

// Check if the file exists directly
if ($uri !== '/' && file_exists($docRoot . $uri)) {
    // If the file exists, return it directly
    return false;
}

// Handle SEO URLs by forwarding to index.php
// The OpenCart .htaccess rules are being simulated here
if (preg_match('/\.(?:png|jpg|jpeg|gif|css|js|ico|svg|woff|woff2|ttf|eot)$/', $uri)) {
    // For static files that don't exist, return 404
    return false;
} else {
    // For all other requests, forward to index.php
    // This simulates OpenCart's SEO URL handling
    $_SERVER['SCRIPT_FILENAME'] = $docRoot . '/index.php';
    include $_SERVER['SCRIPT_FILENAME'];
}
