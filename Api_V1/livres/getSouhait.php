<?php

require_once __DIR__.'/../DatabaseManager.php';

$databaseManager = new DatabaseManager();
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
        echo json_encode($livres); // Convertir en JSON avant de renvoyer
    }
} else {
    http_response_code(405);
    echo json_encode(array("success" => false, "error" => "Méthode non autorisée"));
}
?>
