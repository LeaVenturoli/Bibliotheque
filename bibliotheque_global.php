<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booky - Bibliothèque Global</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>

<body>
<form method="GET" action="recherche.php">
        <input id="barre" type="text" name="query" placeholder="Rechercher un livre...">
        <input id="bouton_recherche" type="submit" value="Rechercher">
    </form>
    </br>
    <header>
        <h1>Bibliothèque</h1>
        <form action="session.php">
            <a href="deconnexion.php" id="deco">Déconnexion</a><br><br>
            <input class="retour" type="submit" value="Retour">
        </form>
    </header>

    <?php
session_start();
require_once("bdd.php");

if (isset($_GET['mise'])) {
    $test = $_GET['mise'];
    echo $test;
}
?>

<div class="livres-ajouter-recement">
    <h2>bibliothèque Global</h2>

    <ul>
        <?php
        $sql = "SELECT livres.*, utilisateurs.PRENOM AS NOM_UTILISATEUR 
                FROM livres 
                INNER JOIN utilisateurs ON livres.ID_UTILISATEUR = utilisateurs.ID_UTILISATEUR 
                WHERE livres.SOUHAIT = 0 
                ORDER BY livres.AUTEUR, IF(livres.TOME IS NULL, 1, 0), livres.TOME ASC";
        $result_recent = $connexion->query($sql);

        if ($result_recent->num_rows > 0) {
            ?>

            <table class="styled-table">
                <tr>
                    <th>Image</th>
                    <th>Nom</th>
                    <th>Tome</th>
                    <th>Auteur</th>
                    <th>Genre</th>
                    <th>Edition</th>
                    <th>Note</th>
                    <th>Ajouté le</th>
                    <th>Emprunté par</th>
                    <th>Ajouté par</th> 
                </tr>

                <?php

                while ($row_recent = $result_recent->fetch_assoc()) {
                    $l = $row_recent['ID'];

                    $sql_emprunteur = "SELECT u.PRENOM from emprunt as e inner join utilisateurs as u on u.ID_UTILISATEUR = e.ID_UTILISATEUR where e.ID_LIVRE = " . $row_recent['ID'];
                    $emprunteur = $connexion->query($sql_emprunteur);

                    $nom_emprunteur = "Ø";
                    while ($res_emprunteur = $emprunteur->fetch_assoc()) {
                        $nom_emprunteur = $res_emprunteur["PRENOM"];
                    }


                    echo "<tr>";
                    echo "<td><a>" . "<center>  <img src='./images-livres/" . $row_recent['IMAGES'] . "' alt='Image du livre' class='livres-image'></center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['NOM_LIVRE'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['TOME'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['AUTEUR'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['GENRE'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['EDITIONS'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['NOTE'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['DATE_AJOUT'] . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $nom_emprunteur . "</center>" . "</a></td>";
                    echo "<td><a>" . "<center>" . $row_recent['NOM_UTILISATEUR'] . "</center>" . "</a></td>"; 
                    echo " </tr>";
                }
                ?>
            </table>
            <?php
        } else {
            echo "<li>Aucun livre dans votre bibliothèque.</li>";

        }
        ?>
</div>
<br>

</body>

<footer>
    <div id="bas">
        <p>&copy; 2023 Booky </p>
    </div>
</footer>

</html>