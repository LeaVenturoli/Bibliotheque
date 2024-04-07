<?php
require_once __DIR__.'/../DatabaseManager.php';

$databaseManager = new DatabaseManager();

$livres = $databaseManager->getLivre();

header('Content-Type: application/json');

if ($livres !== false) {
    echo json_encode(array('success' => true, 'livres' => $livres));
} else {
    echo json_encode(array('success' => false, 'message' => 'No books found.'));
}
?>