<?php
session_start();
require_once ("bdd.php");

if (isset($_SESSION['ID_UTILISATEUR'])) {
    $id_perso = $_SESSION["ID_UTILISATEUR"];
    $ID = $_POST['id_livre'];
    $date_ajout = $_POST['DATE_AJOUT'];

    $select_query = $connexion->prepare("SELECT * FROM livres WHERE ID = ?");
    $select_query->bind_param("s", $ID);
    $select_query->execute();
    $result = $select_query->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $select_query->close();

        $insert_query = $connexion->prepare("INSERT INTO livres (ID_UTILISATEUR, NOM_LIVRE, TOME, AUTEUR, GENRE, EDITIONS, NOTE, DATE_AJOUT, IMAGES) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $insert_query->bind_param("sssssssss", $id_perso, $row['NOM_LIVRE'], $row['TOME'], $row['AUTEUR'], $row['GENRE'], $row['EDITIONS'], $row['NOTE'], $date_ajout, $row['IMAGES']);

        if ($insert_query->execute()) {
            echo json_encode(['success' => 'Livre ajouté avec succès']);
        } else {
            echo json_encode(['error' => 'Erreur lors de l\'ajout : ' . $insert_query->error]);
        }

        $insert_query->close();
    } else {
        echo json_encode(['error' => 'Aucun résultat trouvé pour l\'ID : ' . $ID]);
    }

    $connexion->close();
}
?>
