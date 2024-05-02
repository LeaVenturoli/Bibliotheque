<?php

require_once __DIR__.'/../DatabaseManager.php';
require_once __DIR__ . '/../../bdd.php';

$jsondata = file_get_contents('php://input');
$data = json_decode($jsondata, true);
$method = $_SERVER['REQUEST_METHOD'];

header('Content-Type: application/json');

// Créer une instance de DatabaseManager
$dbManager = new DatabaseManager($connexion);

if ($method === 'POST') {
    if(!isset($data['user_id'])) {
        http_response_code(400);
        echo json_encode(array("success" => false, "error" => "Requête invalide"));
    } else {
        $params = $data['query'] ?? null;
        // Récupérer les livres pour l'utilisateur spécifié
        $livres = $dbManager->getLivres($data['user_id'], $params);

        // Retourner les livres en tant que réponse JSON
        echo $livres;
    }
} else {
    http_response_code(405);
    echo json_encode(array("success" => false, "error" => "Méthode non autorisée"));
}

?>
