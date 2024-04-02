<?php
session_start();
require_once ("../base_de_donnee/bdd.php");

if (!isset($_SESSION["NOM"])) {
    header("location: index.php");
    exit();
}

// Récupérer l'ID de l'utilisateur connecté
$id_utilisateur = $_SESSION['ID_UTILISATEUR'];

// Récupérer la liste des livres empruntés par l'utilisateur
$result = $connexion->query("SELECT emprunt.ID, l.IMAGES, l.NOM_LIVRE, l.TOME, l.AUTEUR, l.GENRE, l.NOTE, l.DATE_AJOUT, emprunt.DATE_PRET FROM livres as l
                            INNER JOIN emprunt ON l.ID = emprunt.ID_LIVRE
                            WHERE emprunt.ID_UTILISATEUR = '$id_utilisateur'");

?>

<!DOCTYPE html>
<html>

<head>
    <title>Booky - Livre emprunté</title>
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
        <h2>Liste des livres empruntés</h2>
        <table class="styled-table">
            <tr>
                <th>Image</th>
                <th>Nom</th>
                <th>Tome</th>
                <th>Auteur</th>
                <th>Genre</th>
                <th>Note</th>
                <th>Date Ajout</th>
                <th>Action</th>
            </tr>
            <?php
            if ($result) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td><center><img src='./images-livres/" . $row['IMAGES'] . "' alt='Image du livre' class='livres-image'></center></td>";
                    echo "<td><center>" . $row['NOM_LIVRE'] . "</center></td>";
                    echo "<td><center>" . $row['TOME'] . "</center></td>";
                    echo "<td><center>" . $row['AUTEUR'] . "</center></td>";
                    echo "<td><center>" . $row['GENRE'] . "</center></td>";
                    echo "<td><center>" . $row['NOTE'] . "</center></td>";
                    echo "<td><center>" . $row['DATE_AJOUT'] . "</center></td>";
                    echo "<td><center><button class='retour1' onclick=\"ouvrirFenetreModale('" . $row['ID'] . "')\">Rendre</button></center></td>";
                    echo "</tr>";
                }
            } else {
                echo '<p>Aucun livre emprunté.</p>';
            }
            ?>
        </table>
    </div>

    <div id="modal">
        <form id="form">

            <button class="retour1" type="button" onclick="soumettreFormulaire()">Rendre ce livre</button>
        </form>
        <button class="retour1" onclick="fermerFenetreModale()">Annuler</button>
    </div>

    <script>
        let IDLIVRE;

        function ouvrirFenetreModale(idLivre) {
            document.getElementById('modal').style.display = 'block';
            IDLIVRE = idLivre;
        }

        function fermerFenetreModale() {
            document.getElementById('modal').style.display = 'none';
        }

        function soumettreFormulaire() {
            let date = new Date();

            var formData = new FormData();
            formData.append('id_livre', IDLIVRE);
            formData.append('DATE_RETOUR', date);

            fetch('rendre.php', {
                method: 'POST',
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    if (data.success) {
                        alert(data.success);
                    } else {
                        alert(data.error);
                    }

                    if (data.success) {
                        location.reload();
                    } else {
                        alert(data.error);
                    }
                })
                .catch(error => {
                    console.error('Erreur lors de la soumission du formulaire:', error);
                });

            fermerFenetreModale();
        }
    </script>

    <footer>
        <div id="bas">
            <p>&copy; 2023 Booky </p>
        </div>
    </footer>

</body>

</html>