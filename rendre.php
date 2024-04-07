<?php
session_start();
require_once ("bdd.php");

if (isset($_SESSION['ID_UTILISATEUR'])) {
    $id_perso = $_SESSION["ID_UTILISATEUR"];
    $ID = $_POST['id_livre'];

    $selectEmprunt = $connexion->prepare("SELECT * FROM emprunt WHERE ID = ? AND ID_UTILISATEUR = ?");
    $selectEmprunt->bind_param("ss", $ID, $id_perso);
    $selectEmprunt->execute();
    $resultEmprunt = $selectEmprunt->get_result();

    if ($resultEmprunt->num_rows > 0) {
        $updateEmprunt = $connexion->prepare("UPDATE livres SET EMPRUNT = 0 WHERE ID = (SELECT ID_LIVRE from emprunt where ID = ?)");
        $updateEmprunt->bind_param("s", $ID);

        $delete = $connexion->prepare("DELETE FROM emprunt WHERE ID = ? AND ID_UTILISATEUR = ?");
        $delete->bind_param("ss", $ID, $id_perso);

        try {
            $updateEmprunt->execute();

            $delete->execute();
            echo json_encode(['success' => 'Livre rendu']);
        } catch (Exception $e) {
            echo json_encode(['error' => 'Une erreur est survenue']);
        }

        $updateEmprunt->close();
    } else {
        echo json_encode(['error' => 'Vous n\'avez pas emprunté ce livre']);
    }

    $selectEmprunt->close();
    $connexion->close();
}
?>