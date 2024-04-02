<?php
session_start();
require_once ("../base_de_donnee/bdd.php");

if (isset($_SESSION['ID_UTILISATEUR'])) {
    $id_perso = $_SESSION["ID_UTILISATEUR"];
    $ID = $_POST['id_livre'];


    $select_query = $connexion->prepare("SELECT * FROM livres WHERE ID = ?");
    $select_query->bind_param("s", $ID);
    $select_query->execute();
    $result = $select_query->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $select_query->close();

        $update_query = $connexion->prepare("UPDATE livres SET ID_UTILISATEUR=?, NOM_LIVRE=?, TOME=?, AUTEUR=?, GENRE=?, EDITIONS=?, NOTE=?, DATE_AJOUT=?, IMAGES=? WHERE ID=?");
        $update_query->bind_param("ssssssssss", $id_perso, $row['NOM_LIVRE'], $row['TOME'], $row['AUTEUR'], $row['GENRE'], $row['EDITIONS'], $row['NOTE'], $date_ajout, $row['IMAGES'], $ID);

        if ($update_query->execute()) {
            echo json_encode(['success' => 'Livre mis à jour avec succès']);
        } else {
            echo json_encode(['error' => 'Erreur lors de la mise à jour : ' . $update_query->error]);
        }

        $update_query->close();
    } else {
        echo json_encode(['error' => 'Aucun résultat trouvé pour l\'ID : ' . $ID]);
    }

    $connexion->close();
}
?>