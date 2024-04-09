<?php

require_once __DIR__.'/../DatabaseManager.php';
require_once __DIR__ . '/../../bdd.php';

$databaseManager = new DatabaseManager($connexion);
$jsondata = file_get_contents('php://input');
$data = json_decode($jsondata, true);
$method = $_SERVER['REQUEST_METHOD'];

header('Content-Type: application/json');

if($method == 'POST') {
    if(!isset($data['user_id'])) {
        http_response_code(400);
        echo json_encode(array("success" => false, "error" => "Requête invalide"));
    } else {
        $livres = $databaseManager->souhaitLivre($data['user_id']);
        echo $livres; // J'ai modifié ça, fait ctrl Z yavai un json_encode
    }
} else {
    http_response_code(405);
    echo json_encode(array("success" => false, "error" => "Méthode non autorisée"));
}
?>
