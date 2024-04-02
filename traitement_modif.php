<?php

require_once ("../base_de_donnee/bdd.php");

$id = $_POST['id_livre'];
$modif_livre = $_POST['nom_livre'];
$modif_tome = isset($_POST["TOME"]) && $_POST["TOME"] !== "" ? floatval($_POST["TOME"]) : null;
$modif_auteur = $_POST['auteur'];
$modif_editions = $_POST['editions'];
$modif_note = isset($_POST["NOTE"]) && $_POST["NOTE"] !== "" ? floatval($_POST["NOTE"]) : null;

// Récupérer la valeur du genre actuel à partir du champ caché
$genre_actuel = $_POST['genre_actuel'];
$modif_genre = isset($_POST['GENRE']) && $_POST['GENRE'] !== "" ? $_POST['GENRE'] : $genre_actuel;

$sql = "UPDATE livres SET  NOM_LIVRE = ?, TOME = ?, AUTEUR = ?, GENRE = ?, EDITIONS = ?, NOTE=?  WHERE ID = ?";
$requete = $connexion->prepare($sql);
$requete->bind_param("ssssssi", $modif_livre, $modif_tome, $modif_auteur, $modif_genre, $modif_editions, $modif_note, $id);

if ($requete->execute()) {
    header('location: bibliotheque_personnelle.php?mise=livre modifié avec succès ! ');
} else {
    echo "Échec de la mise à jour : " . $connexion->error;
}

$connexion->close();

?>
