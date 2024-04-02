<?php

session_start();
require_once ("../Bibliotheque/bdd.php");

$MDP = $_POST['MDP'];
$email = $_POST['mail'];
$MDP = hash('sha256', $MDP);

$resultat = mysqli_query($connexion, "SELECT * FROM utilisateurs WHERE mail = '$email' AND MDP = '$MDP'");

if (mysqli_num_rows($resultat) > 0) {
    $row = mysqli_fetch_assoc($resultat);

    $_SESSION["email"] = $email;
    $_SESSION["PRENOM"] = $row["PRENOM"];
    $_SESSION["NOM"] = $row["NOM"];
    $_SESSION["ID_UTILISATEUR"] = $row["ID_UTILISATEUR"];

    header("Location: session.php");
    exit;
} else {
    echo "Email ou mot de passe incorrect.";
}

$connexion->close();

?>