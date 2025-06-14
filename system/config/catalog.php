<?php
// Site
$_['site_base']        = HTTP_SERVER;
$_['site_ssl']         = HTTPS_SERVER;

// Url
$_['url_autostart']    = false;

// Database
$_['db_autostart']     = true;
$_['db_type']          = DB_DRIVER; // mpdo, mssql, mysql, mysqli or postgre
$_['db_hostname']      = DB_HOSTNAME;
$_['db_username']      = DB_USERNAME;
$_['db_password']      = DB_PASSWORD;
$_['db_database']      = DB_DATABASE;
$_['db_port']          = DB_PORT;
$_['db_charset']       = DB_CHARSET;

// Session
$_['session_autostart'] = false;

// Autoload Libraries
$_['library_autoload'] = array(
	'openbay'
);

$registry = new Registry();
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, DB_PORT, DB_CHARSET);
$registry->set('db', $db);

$query = $db->query("SELECT value FROM " . DB_PREFIX . "setting WHERE store_id = '0' AND `key`='config_seo_url_type'");

if ($query->num_rows) {
  $seo_type = $query->row['value'];
}else{
  $seo_type = 'seo_url';
}

// Actions
$_['action_pre_action'] = array(
	'startup/session',
	'startup/startup',
	'startup/error',
	'startup/event',
	'startup/maintenance',
    'startup/'.$seo_type
);

// Action Events
$_['action_event'] = array(
	'view/*/before'                         => 'event/theme',

	'model/extension/analytics/*/before'    => 'event/compatibility/beforeModel',
	'model/extension/captcha/*/before'      => 'event/compatibility/beforeModel',
	'model/extension/credit_card/*/before'  => 'event/compatibility/beforeModel',
	'model/extension/feed/*/before'         => 'event/compatibility/beforeModel',
	'model/extension/fraud/*/before'        => 'event/compatibility/beforeModel',
	'model/extension/module/*/before'       => 'event/compatibility/beforeModel',
	'model/extension/payment/*/before'      => 'event/compatibility/beforeModel',
	'model/extension/recurring/*/before'    => 'event/compatibility/beforeModel',
	'model/extension/shipping/*/before'     => 'event/compatibility/beforeModel',
	'model/extension/theme/*/before'        => 'event/compatibility/beforeModel',
	'model/extension/total/*/before'        => 'event/compatibility/beforeModel',

	'model/analytics/*/after'               => 'event/compatibility/afterModel',
	'model/captcha/*/after'                 => 'event/compatibility/afterModel',
	'model/credit_card/*/after'             => 'event/compatibility/afterModel',
	'model/feed/*/after'                    => 'event/compatibility/afterModel',
	'model/fraud/*/after'                   => 'event/compatibility/afterModel',
	'model/module/*/after'                  => 'event/compatibility/afterModel',
	'model/payment/*/after'                 => 'event/compatibility/afterModel',
	'model/recurring/*/after'               => 'event/compatibility/afterModel',
	'model/shipping/*/after'                => 'event/compatibility/afterModel',
	'model/theme/*/after'                   => 'event/compatibility/afterModel',
	'model/total/*/after'                   => 'event/compatibility/afterModel',

	//'language/extension/*/before'         => 'event/translation',
	'language/extension/analytics/*/before' => 'event/compatibility/language',
	'language/extension/captcha/*/before'   => 'event/compatibility/language',
	'language/extension/feed/*/before'      => 'event/compatibility/language',
	'language/extension/fraud/*/before'     => 'event/compatibility/language',
	'language/extension/module/*/before'    => 'event/compatibility/language',
	'language/extension/payment/*/before'   => 'event/compatibility/language',
	'language/extension/recurring/*/before' => 'event/compatibility/language',
	'language/extension/shipping/*/before'  => 'event/compatibility/language',
	'language/extension/theme/*/before'     => 'event/compatibility/language',
	'language/extension/total/*/before'     => 'event/compatibility/language'

	//'controller/*/before'                 => 'event/debug/before',
	//'controller/*/after'                  => 'event/debug/after'
);

//Cache
$_['url_alias_cache_ttl'] = 60*60*24*7;
$_['product_cache_ttl'] = 60*60;
$_['search_cache_ttl'] = 60*60;