<?php

require_once __DIR__.'/../DatabaseManager.php';
require_once __DIR__ . '/../../bdd.php';

$databaseManager = new DatabaseManager($connexion);
$method = $_SERVER['REQUEST_METHOD'];

header('Content-Type: application/json');

// Vérifie si la méthode est POST et que les données nécessaires sont présentes
if ($method === 'POST' && isset($_FILES['image'])) {
    // Déplacement du fichier téléchargé vers le dossier de destination
    $dossier_destination = __DIR__ . "/../../images-livres/";
    $chemin_image = $dossier_destination . $_FILES['image']['name'];
    if(move_uploaded_file($_FILES['image']['tmp_name'], $chemin_image)) {
        echo json_encode(array("success" => true, "message" => "L'image a été téléchargée avec succès."));
    } else {
        echo json_encode(array("success" => false, "message" => "Une erreur s'est produite lors du téléchargement de l'image."));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Méthode invalide ou données manquantes."));
}
