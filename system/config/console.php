<?php
// Language
$_['language_default'] = 'en-gb';
$_['language_autoload'] = array('en-gb');

// Session
$_['session_engine'] = 'file';
$_['session_autostart'] = FALSE;
$_['session_name'] = 'OCSESSID';

// Actions
$_['action_default'] = 'common/home';
$_['action_router'] = 'startup/router';
$_['action_error'] = 'error/not_found';
$_['action_pre_action'] = array(
    'startup/language',
    'startup/database',
    'startup/startup',
    'startup/seo_pro',
);

// Action Events
$_['action_event'] = array();

// Cache
$_['url_alias_cache_ttl'] = 60 * 60 * 24 * 7;
$_['product_cache_ttl'] = 60 * 60 * 24;
$_['search_cache_ttl'] = 60 * 60 * 24;

$_['cache_engine'] = 'file'; // apc, file, mem or memcached

// Google Merchant
$_['google_merchant_id'] = '5311431044';

