<?php
class Language {
	private $default = 'en-gb';
	private $directory;
	private $data = array();

	public function __construct($directory = '') {
		$this->directory = $directory;
	}

	public function get($key) {
		return (isset($this->data[$key]) ? $this->data[$key] : $key);
	}
	
	public function set($key, $value) {
		$this->data[$key] = $value;
	}
	
	// Please dont use the below function i'm thinking getting rid of it.
	public function all() {
		return $this->data;
	}
	
	// Please dont use the below function i'm thinking getting rid of it.
	public function merge(&$data) {
		array_merge($this->data, $data);
	}
			
	public function load($filename, &$data = array()) {
		$_ = array();

		$file = DIR_LANGUAGE . 'english/' . $filename . '.php';
		
		// Compatibility code for old extension folders
		$old_file = DIR_LANGUAGE . 'english/' . str_replace('extension/', '', $filename) . '.php';
		
		if (is_file($file)) {
			require(modification($file));
		} elseif (is_file($old_file)) {
			require(modification($old_file));
		}

		$file = DIR_LANGUAGE . $this->default . '/' . $filename . '.php';

		// Compatibility code for old extension folders
		$old_file = DIR_LANGUAGE . $this->default . '/' . str_replace('extension/', '', $filename) . '.php';
		
		if (is_file($file)) {
			require(modification($file));
		} elseif (is_file($old_file)) {
			require(modification($old_file));
		}

		$file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';

		// Compatibility code for old extension folders
		$old_file = DIR_LANGUAGE . $this->directory . '/' . str_replace('extension/', '', $filename) . '.php';
		
		if (is_file($file)) {
			require(modification($file));
		} elseif (is_file($old_file)) {
			require(modification($old_file));
		}

		$this->data = array_merge($this->data, $_);

		return $this->data;
	}
	
	// Правильные склонения
	function plural($number, $array){
	   $keys = [2, 0, 1, 1, 1, 2];
	   return $array[$number % 100 > 4 && $number % 100 < 20 ? 2 : $keys[min($number % 10, 5)]];
	}
}
