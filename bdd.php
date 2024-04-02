<?php

$serveur = "localhost";
$utilisateur = "root";
$mot_de_passe = "Margo0810";
$nom_base_de_donnees = "bibliotheque";

$connexion = new mysqli($serveur, $utilisateur, $mot_de_passe, $nom_base_de_donnees);

if ($connexion->connect_error) {
    die("Erreur de connexion à la base de données : " . $connexion->connect_error);
}

?>