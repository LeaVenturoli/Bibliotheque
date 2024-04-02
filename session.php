<?php
session_start();
require_once ("bdd.php");

if (!isset($_SESSION["NOM"])) {
    header("location: index.php");
    exit();
}

$result = $connexion->query("SELECT COUNT(*) AS possession_count
    FROM livres 
    JOIN utilisateurs AS u ON u.ID_UTILISATEUR = livres.ID_UTILISATEUR 
    WHERE u.MAIL = '" . $_SESSION['email'] . "'
    AND livres.SOUHAIT = 0");

if ($result) {
    $row = $result->fetch_assoc();
    $possessionCount = $row['possession_count'];
}

$resultEmprunt = $connexion->query("SELECT COUNT(*) AS emprunt_count
    FROM emprunt
    JOIN utilisateurs AS u ON u.ID_UTILISATEUR = emprunt.ID_UTILISATEUR 
    WHERE u.MAIL = '" . $_SESSION['email'] . "'");

if ($resultEmprunt) {
    $rowEmprunt = $resultEmprunt->fetch_assoc();
    $empruntCount = $rowEmprunt['emprunt_count'];
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Booky - Accueil</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
    <form method="GET" action="recherche.php">
        <input id="barre" type="text" name="query" placeholder="Rechercher un livre...">
        <input id="bouton_recherche" type="submit" value="Rechercher">
    </form>
    </br>
    <div id="bienvenue">
        <center>
            <?php
            echo 'Bienvenue ' . $_SESSION["PRENOM"];
            ?>
        </center>
    </div>
    <div id="possede">
        <center>
            <?php
            if ($possessionCount > 0) {
                echo "Vous possédez " . $possessionCount . " livres.";
            } else {
                echo "Vous n'avez pas encore de livre.";
            }
            echo "<br>";

            if ($empruntCount > 0) {
                echo "Vous avez emprunté " . $empruntCount . " livres.";
            } else {
                echo "Vous n'avez pas encore emprunté de livre.";
            }

            $sql = "SELECT l.NOM_LIVRE, l.id 
                    FROM livres as l
                    INNER JOIN utilisateurs as u ON u.ID_UTILISATEUR = l.ID_UTILISATEUR
                    WHERE u.ID_UTILISATEUR = " . $_SESSION["ID_UTILISATEUR"] . "
                    ORDER BY DATE_AJOUT";

            $result_recent = $connexion->query($sql);
            $array_of_livre = [];

            if ($result_recent) {
                if ($result_recent->num_rows > 0) {
                    while ($row_recent = $result_recent->fetch_assoc()) {
                        $array_of_livre[$row_recent['id']] = $row_recent['NOM_LIVRE'];
                    }
                }
            }
            ?>
        </center>
        <center>
            <a href="deconnexion.php" id="deco2">Déconnexion</a>
        </center>
    </div>

    <div class="bouton-container">
        <form action="ajouter_livre.php" method="post">
            <button type="submit" class="bouton">Ajouter un livre</button>
        </form>
        <form action="bibliotheque_personnelle.php" method="get">
            <button type="submit" class="bouton">Bibliothèque personnelle</button>
        </form>
        <form action="preter_livre.php" method="post">
            <button type="submit" class="bouton">Emprunter un livre</button>
        </form>
    </div>
    <div class="bouton-souhait">
        <form action="souhait.php" method="post">
            <button type="submit" class="bouton-souhait2">Liste de souhait</button>
        </form>
        <form action="livres_emp.php" method="post">
            <button type="submit" class="bouton-souhait2">Livre emprunté</button>
        </form>

        <form action="bibliotheque_global.php" method="post">
            <button type="submit" class="bouton-souhait2">Bibliotheque Global</button>
        </form>

    </div>

    <h1 class="titrelivre">Sélectionner un livre à supprimer</h1>
    <?php
    if (!empty($array_of_livre)) {
        ?>
        <form class="suppr" action="supprimer.php" method="post">
            <label for="livre">Sélectionner un livre :</label>
            <select name="ID_LIVRE" id="livre">
                <?php
                foreach ($array_of_livre as $id => $nom_livre) {
                    echo "<option value='" . $id . "'>" . $nom_livre . "</option>";
                }
                ?>
            </select>
            <input type="submit" value="Supprimer le livre">
        </form>
        <?php
    } else {
        echo "<div style='text-align: center; font-family: \"Courier New\", Courier, monospace;'>Aucun ouvrage ne peut être supprimé pour cet utilisateur.</div>";
    }
    ?>

    <div class="livres-ajouter-recement">
        <h2>Livres Récemment Ajoutés</h2>
        <ul>
            <?php
            $sql = "SELECT u.PRENOM, l.NOM_LIVRE, l.AUTEUR, l.IMAGES, l.TOME FROM livres as l INNER JOIN utilisateurs as u ON u.ID_UTILISATEUR = l.ID_UTILISATEUR AND SOUHAIT = 0 ORDER BY DATE_AJOUT DESC LIMIT 10";
            $result_recent = $connexion->query($sql);

            if ($result_recent->num_rows > 0) {
                while ($row_recent = $result_recent->fetch_assoc()) {
                    echo "<li>";
                    if (!empty($row_recent["IMAGES"])) {
                        echo "<a href='recherche.php?query=" . urlencode($row_recent["NOM_LIVRE"]) . "'>";
                        echo "<img src='./images-livres/" . $row_recent["IMAGES"] . "' alt='Image du livre' class='livres-image'>";
                        echo "</a>";
                    }
                    echo "<div class='livres-details'>" . $row_recent["NOM_LIVRE"] . " par " . $row_recent["AUTEUR"];

                    if (!empty($row_recent["TOME"])) {
                        echo "<br>Tome " . $row_recent["TOME"];
                    }

                    echo "<br> Ajouté par " . $row_recent["PRENOM"] . "</div></li>";
                }
            } else {
                echo "<li>Aucun livre récemment ajouté.</li>";
            }
            ?>
        </ul>
    </div>
</body>
<footer>
    <div id="bas">
        <p>&copy; 2023 Booky </p>
    </div>
</footer>

</html>