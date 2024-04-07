<?php
session_start();
require_once ("bdd.php");
?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>Booky - Recherche</title>
  <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">

</head>
<header>
  <h1>Recherche</h1>
  <form action="session.php">
    <a href="deconnexion.php" id="deco">Déconnexion</a><br><br>
    <input class="retour" type="submit" value="Retour">

  </form>

</header>

<body>

  <div class="container2">
    <h1>Résultats de la Recherche</h1>
    <form method="GET" action="recherche.php">
      <input id="barre" type="text" name="query" placeholder="Rechercher un livre...">
      <input id="bouton_recherche" type="submit" value="Rechercher">
    </form>
  </div>
  <?php

  if (isset($_GET['query'])) {
    $search_query = $_GET['query'];

    $search_query = mysqli_real_escape_string($connexion, $search_query);
    $id_utilisateur = $_SESSION['ID_UTILISATEUR'];

    $sql = "SELECT l.NOM_LIVRE, MAX(l.AUTEUR) as AUTEUR, MAX(l.GENRE) as GENRE, MAX(l.NOTE) as NOTE, MAX(l.IMAGES) as IMAGES, MAX(u.PRENOM) as PRENOM, MAX(l.ID) as ID, MAX(l.TOME) as TOME
    FROM livres as l
    INNER JOIN utilisateurs as u ON l.ID_UTILISATEUR = u.ID_UTILISATEUR
    WHERE (l.NOM_LIVRE LIKE '%$search_query%' OR l.AUTEUR LIKE '%$search_query%' OR l.GENRE LIKE '%$search_query%' OR l.NOTE LIKE '%$search_query%' OR u.PRENOM LIKE '%$search_query%')
        AND l.ID_UTILISATEUR != $id_utilisateur
    GROUP BY l.NOM_LIVRE, l.TOME";


    $result = $connexion->query($sql);



    $connexion->close();
  }
  ?>


  <div class="livres-ajouter-recement">
    <table class="styled-table">
      <tr>
        <th>Image</th>
        <th>Nom</th>
        <th>Auteur</th>
        <th>Genre</th>
        <th>Note</th>
        <th>Tome</th>
        <th>Ajouté par</th>
        <th>Ajouter à sa bibliothèque</th>
      </tr>

      <?php

      while ($row_recent = $result->fetch_assoc()) {
        $id_livre = $row_recent['ID'];
        echo "<tr>";
        echo "<td>" . "<center> <img src='./images-livres/" . $row_recent['IMAGES'] . "' alt='Image du livre' class='livres-image'> </center>" . "</td>";
        echo "<td>" . "<center>" . $row_recent['NOM_LIVRE'] . "</center>" . "</td>";
        echo "<td>" . "<center>" . $row_recent['AUTEUR'] . "</center>" . "</td>";
        echo "<td>" . "<center>" . $row_recent['GENRE'] . "</center>" . "</td>";
        echo "<td>" . "<center>" . $row_recent['NOTE'] . "</center>" . "</td>";
        echo "<td>" . "<center>" . $row_recent['TOME'] . "</center>" . "</td>";
        echo "<td>" . "<center>" . $row_recent['PRENOM'] . "</center>" . "</td>";
        echo "<td>" . '<button onclick="ouvrirFenetreModale(' . $id_livre . ')">Ajouter le livre à ma bibliothèque</button>' . "</td>";

        ?>

        <div id="modal">
          <form id="form">
            <input type="hidden" name="id_livre" value="<?php echo $id_livre; ?>">

            <label for="DATE_AJOUT">Date d'ajout :</label>
            <input type="date" id="DATE_AJOUT" name="DATE_AJOUT" required><br><br>

            <button type="button" onclick="soumettreFormulaire()">Ajouter ce livre</button>

          </form>
          <button onclick="fermerFenetreModale()">Fermer</button>
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
            var date_ajout = document.getElementById('DATE_AJOUT').value;

            var formData = new FormData();
            formData.append('id_livre', IDLIVRE);
            formData.append('DATE_AJOUT', date_ajout);

            fetch('ajouter.php', {
              method: 'POST',
              body: formData
            })
              .then(response => response.json())
              .then(data => {
                if (data.success) {
                  alert('Livre ajouté avec succès');
                } else {
                  alert('erreur ');
                }
              })
              .catch(error => {
                console.error('Erreur lors de la soumission du formulaire:', error);
              });

            fermerFenetreModale();
          }
        </script>

        <?php

        echo "</td>";
        echo "</tr>";
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