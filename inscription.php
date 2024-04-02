<?php

session_start();

require_once("bdd.php");
$connexion = mysqli_connect($serveur, $utilisateur, $mot_de_passe, $nom_base_de_donnees);

if (!$connexion) {
    die("La connexion à la base de données a échoué : " . mysqli_connect_error());
}

$res = array();

if (isset($_POST['nom']) && isset($_POST['prenom']) && isset($_POST['mail']) && isset($_POST['MDP'])) {
    $nom = mysqli_real_escape_string($connexion, $_POST['nom']);
    $prenom = mysqli_real_escape_string($connexion, $_POST['prenom']);
    $email = mysqli_real_escape_string($connexion, $_POST['mail']);
    $motDePasse = mysqli_real_escape_string($connexion, $_POST['MDP']);

    // Assurez-vous de hash le mot de passe de manière sécurisée
    $motDePasseHash = hash('sha256', $motDePasse);

    $sql = "INSERT INTO utilisateurs (nom, prenom, mail, MDP) VALUES ('$nom', '$prenom', '$email', '$motDePasseHash')";
    
    try {
        if (mysqli_query($connexion, $sql)) {
            header('location: index.php?m=Inscription réussie&email=' . $email);
        }   
    } catch(mysqli_sql_exception $e) {
         header('location: index.php?n=Votre adresse mail existe déjà');
    }
}


$connexion->close();
session_destroy();

?>
