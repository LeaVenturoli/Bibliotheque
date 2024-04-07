<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booky - Bibliothèque personnelle</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <form method="GET" action="recherche_bp.php">
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

    <?php
    session_start();
    require_once ("bdd.php");

    if (isset($_GET['mise'])) {
        $test = $_GET['mise'];
        echo $test;
    }
    ?>

    <div class="livres-ajouter-recement">
        <h2>Livres Ajoutés</h2>
        <p>Pour modifier une valeur cliquer dessus
        <p>
        <ul>
            <?php
            $sql = "SELECT * FROM livres WHERE ID_UTILISATEUR = " . $_SESSION['ID_UTILISATEUR'] . " AND SOUHAIT = 0 ORDER BY AUTEUR, IF(TOME IS NULL, 1, 0), TOME ASC";
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
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>  <img src='./images-livres/" . $row_recent['IMAGES'] . "' alt='Image du livre' class='livres-image'></center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['NOM_LIVRE'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['TOME'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['AUTEUR'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['GENRE'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['EDITIONS'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['NOTE'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $row_recent['DATE_AJOUT'] . "</center>" . "</a></td>";
                        echo "<td><a href = 'Modification.php?id=$l'>" . "<center>" . $nom_emprunteur . "</center>" . "</a></td>";
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