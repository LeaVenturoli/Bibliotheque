<?php

require_once __DIR__.'/../DatabaseManager.php';

$databaseManager = new DatabaseManager();
$jsondata = file_get_contents('php://input');
$data = json_decode($jsondata, true);
$method = $_SERVER['REQUEST_METHOD'];

header('Content-Type: application/json');

if ($method == 'POST') {
    if (!isset($data['MAIL']) || !isset($data['MDP'])) {
        http_response_code(400); // Bad Request
        echo json_encode(array("success" => false, "error" => "Invalid request"));
        exit;
    }

    $MAIL = $data['MAIL'];
    $MDP = $data['MDP'];
    $user = $databaseManager->connectUser($MAIL, $MDP); 

    if ($user !== false) {
        http_response_code(200); 
        echo json_encode(array("success" => true, "user_id" => $user['ID_UTILISATEUR'], "prenom" => $user['PRENOM'], "user" => $user));
    } else {
        http_response_code(401); 
        echo json_encode(array("success" => false, "error" => "Invalid credentials"));
    }
} else {
    http_response_code(405); 
    echo json_encode(array("success" => false, "error" => "Invalid request method"));
}
?>
