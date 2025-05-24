<?php
class ControllerStartupDatabase extends Controller {
	public function index() {
		$this->registry->set('db', new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, DB_PORT));
	}
}