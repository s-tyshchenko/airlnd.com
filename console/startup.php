<?php
// Error Reporting
//error_reporting(E_ALL);

// Check Version
if (version_compare(phpversion(), '5.4.0', '<') == true) {
	exit('PHP5.4+ Required');
}

if (!ini_get('date.timezone')) {
	date_default_timezone_set('UTC');
}

// Modification Override
function modification($filename) {
    $file = DIR_MODIFICATION . 'console/' . substr($filename, strlen(DIR_APPLICATION));

	if (is_file($file)) {
		return $file;
	}

	return $filename;
}

// Autoloader
if (is_file(DIR_SYSTEM . '../vendor/autoload.php')) {
	require_once(DIR_SYSTEM . '../vendor/autoload.php');
}

function library($class) {
	
	if(defined('REPLACE_PAGINATION') && $class == 'Pagination'){
		$file = DIR_SYSTEM . 'library/' . str_replace('\\', '/', strtolower($class)) . '_catalog.php';
	} else {
		$file = DIR_SYSTEM . 'library/' . str_replace('\\', '/', strtolower($class)) . '.php';
	}

	if (is_file($file)) {
		include_once(modification($file));

		return true;
	} else {
		return false;
	}
}

spl_autoload_register('library');
spl_autoload_extensions('.php');

// Engine
require_once(modification(DIR_SYSTEM . 'engine/action.php'));
require_once(modification(DIR_SYSTEM . 'engine/controller.php'));
require_once(modification(DIR_SYSTEM . 'engine/event.php'));
require_once(modification(DIR_SYSTEM . 'engine/front.php'));
require_once(modification(DIR_SYSTEM . 'engine/loader.php'));
require_once(modification(DIR_SYSTEM . 'engine/model.php'));
require_once(modification(DIR_SYSTEM . 'engine/registry.php'));
require_once(modification(DIR_SYSTEM . 'engine/proxy.php'));

// Helper
require_once(DIR_SYSTEM . 'helper/general.php');
require_once(DIR_SYSTEM . 'helper/utf8.php');
require_once(DIR_SYSTEM . 'helper/json.php');

function start($application_config) {
	require_once(DIR_SYSTEM . 'framework.php');
}
