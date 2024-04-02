<?php
session_start();
require_once ("../base_de_donnee/bdd.php");


if (!isset($_SESSION["NOM"])) {
    header("location: index.php");
    exit();
}

$result = $connexion->query("SELECT COUNT(*) FROM livres 
    JOIN utilisateurs AS u ON u.ID_UTILISATEUR = livres.ID_UTILISATEUR 
    WHERE u.MAIL = '" . $_SESSION['email'] . "'");

if ($result) {
    $row = $result->fetch_assoc();
    $count = $row['COUNT(*)'];
}
?>


<!DOCTYPE html>
<html>

<head>
    <title>Booky - Liste de souhait</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
    <form method="GET" action="recherche_bp.php">
        <label for="barre"> </label>
        <input id="barre" type="text" name="query" placeholder="Rechercher un livre dans ma bibliothèque...">
        <input id="bouton_recherche" type="submit" value="Rechercher">
    </form>
    </br>

    <header>

        <h1>Ma Bibliothèque</h1>
        <form action="session.php">
            <a href="deconnexion.php" id="deco">Déconnexion</a><br><br>
            <input class="retour" type="submit" value="Retour">


        </form>

    </header>
    <div class="livres-ajouter-recement">
        <h2>Liste de souhait</h2>
        <ul>
            <?php
            $sql = " SELECT * FROM livres where ID_UTILISATEUR =" . $_SESSION['ID_UTILISATEUR'] . " AND SOUHAIT = 1 ORDER BY DATE_AJOUT";
            $result_recent = $connexion->query($sql);
            if ($result_recent->num_rows > 0) {
                ?>

                <form method="POST" action="souhait.php">
                    <table class="styled-table">
                        <tr>
                            <th>Image</th>
                            <th>Nom</th>
                            <th>Tome</th>
                            <th>Auteur</th>
                            <th>Genre</th>
                            <th>Edition</th>
                            <th>Acheté</th>
                        </tr>

                        <?php
                        while ($row_recent = $result_recent->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td><center><img src='./images-livres/" . $row_recent['IMAGES'] . "' alt='Image du livre' class='livres-image'></center></td>";
                            echo "<td><center>" . $row_recent['NOM_LIVRE'] . "</center></td>";
                            echo "<td><center>" . $row_recent['TOME'] . "</center></td>";
                            echo "<td><center>" . $row_recent['AUTEUR'] . "</center></td>";
                            echo "<td><center>" . $row_recent['GENRE'] . "</center></td>";
                            echo "<td><center>" . $row_recent['EDITIONS'] . "</center></td>";
                            echo "<td><button type='submit' name='livre_achete[" . $row_recent['ID'] . "]'>Livre acheté</button></td>";

                            echo "</center></td>";
                        }
                        ?>
                    </table>
                    <?php
            } else {
                echo "<li>Aucun livre ajouté dans votre liste de souhait.</li>";

            }
            ?>

            </form>
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $livresAchetes = isset($_POST['livre_achete']) ? $_POST['livre_achete'] : [];

                foreach ($livresAchetes as $livreId => $value) {
                    $updateQuery = "UPDATE livres SET SOUHAIT = 0 WHERE ID = $livreId";
                    $connexion->query($updateQuery);
                }

                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            ?>
    </div>

</body>

<footer>
    <div id="bas">
        <p>&copy; 2023 Booky </p>
    </div>
</footer>

</html>