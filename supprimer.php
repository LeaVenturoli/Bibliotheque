<?php

session_start();

require_once ("../base_de_donnee/bdd.php");

$id = $_POST['ID_LIVRE'];

$sql = "DELETE FROM livres WHERE ID = '$id'";
$sql2 = "DELETE FROM emprunt WHERE ID_LIVRE = '$id'";

if ($connexion->query($sql) === TRUE and $connexion->query($sql2) === TRUE) {
    echo "Livre supprimé avec succès.";

    header("Location: session.php");
} else {
    echo "Erreur : " . $sql . "<br>" . $connexion->error;
}

$connexion->close();

?>