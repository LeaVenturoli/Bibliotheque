<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booky - Recherche</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <form method="GET" action="recherche_bp.php">
        <input id="barre" type="text" name="query" placeholder="Rechercher un livre...">
        <input id="bouton_recherche" type="submit" value="Rechercher">
    </form>

    <header>
        <h1>Ma Bibliothèque</h1>
        <form action="bibliotheque_personnelle.php">
            <a href="deconnexion.php" id="deco">Déconnexion</a><br><br>
            <input class="retour" type="submit" value="Retour">


        </form>




    </header>
    <?php
session_start();
require_once ("bdd.php");

    if (isset($_GET['query'])) {
        $search_query = $_GET['query'];
        $search_query = mysqli_real_escape_string($connexion, $search_query);

        if (isset($_SESSION['ID_UTILISATEUR'])) {
            $sql = "SELECT * FROM livres 
                WHERE ID_UTILISATEUR = " . $_SESSION['ID_UTILISATEUR'] . " 
                AND (NOM_LIVRE LIKE '%$search_query%' OR AUTEUR LIKE '%$search_query%' OR GENRE LIKE '%$search_query%' OR NOTE LIKE '%$search_query') 
                ORDER BY DATE_AJOUT";

            $result_recent = $connexion->query($sql);

        }
    }
    $connexion->close();
    ?>


    <div class="livres-ajouter-recement">
        <table class="styled-table">
            <tr>
                <th>Image</th>
                <th>Nom</th>
                <th>Tome</th> <!-- Ajout de la colonne "Tome" -->
                <th>Auteur</th>
                <th>Genre</th>
                <th>Note</th>
                <th>Ajouter le</th>
            </tr>


            <?php

            while ($row_recent = $result_recent->fetch_assoc()) {
                $id_livre = $row_recent['ID'];
                echo "<tr>";
                echo "<td>" . "<center> <img src='./images-livres/" . $row_recent['IMAGES'] . "' alt='Image du livre' class='livres-image'> </center>" . "</td>";
                echo "<td>" . "<center>" . $row_recent['NOM_LIVRE'] . "</center>" . "</td>";
                echo "<td>" . "<center>" . $row_recent['TOME'] . "</center>" . "</td>"; // Affichage du tome
                echo "<td>" . "<center>" . $row_recent['AUTEUR'] . "</center>" . "</td>";
                echo "<td>" . "<center>" . $row_recent['GENRE'] . "</center>" . "</td>";
                echo "<td>" . "<center>" . $row_recent['NOTE'] . "</center>" . "</td>";
                echo "<td>" . "<center>" . $row_recent['DATE_AJOUT'] . "</center>" . "</td>";
                echo "</tr>";


                ?>


                <?php

                echo "</td>";
            }

            ?>

        </table>
    </div>
    <footer>
        <div id="bas">
            <p>&copy; 2023 Booky </p>
        </div>
    </footer>
</body>

</html>