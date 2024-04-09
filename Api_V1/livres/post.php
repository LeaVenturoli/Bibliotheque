<?php

require_once __DIR__.'/../DatabaseManager.php';
require_once __DIR__ . '/../../bdd.php';

$databaseManager = new DatabaseManager($connexion);
$jsondata = file_get_contents('php://input');
$data = json_decode($jsondata, true);
$method = $_SERVER['REQUEST_METHOD'];

header('Content-Type: application/json');

if($method == 'POST') {

}
