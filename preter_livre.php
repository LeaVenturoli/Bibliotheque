<?php

if (isset($_GET['livre_id'])) {
  $livre_id = $_GET['livre_id'];
}

?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booky - Emprunter un livre</title>
  <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
  <link rel="stylesheet" href="style.css">
</head>

<body>

  <header>
    <h1>Emprunter un livre</h1>
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

    if (!isset($_SESSION['livres_empruntes'])) {
      $_SESSION['livres_empruntes'] = array();
    }

    if (isset($_GET['livre_id'])) {
      $livre_id = $_GET['livre_id'];
    }

  }
  ?>
  <div class="livres-ajouter-recement">
    <h2>Livres a emprunter</h2>
    <ul>
      <?php

      $sql = " SELECT u.PRENOM, l.ID, l.IMAGES, l.NOM_LIVRE, l.TOME, l.AUTEUR, l.GENRE, l.NOTE, l.DATE_AJOUT FROM livres as l inner join utilisateurs as u on u.ID_UTILISATEUR = l.ID_UTILISATEUR where l.ID_UTILISATEUR <>" . $_SESSION['ID_UTILISATEUR'] . " AND SOUHAIT = 0 and EMPRUNT = 0 ORDER BY l.DATE_AJOUT";

      $result_recent = $connexion->query($sql);

      if (!empty($result_recent) && $result_recent->num_rows > 0) {
        ?>
        <table class="styled-table">
          <tr>
            <th>Image</th>
            <th>Nom</th>
            <th>Tome</th>
            <th>Auteur</th>
            <th>Genre</th>
            <th>Note</th>
            <th>Ajouté le</th>
            <th>Par</th>
            <th>Emprunter </th>

          </tr>

          <?php

          while ($row_recent = $result_recent->fetch_assoc()) {
            $id_livre = $row_recent['ID'];
            echo "<tr>";
            echo "<td>" . "<center>  <img src='./images-livres/" . $row_recent['IMAGES'] . "' alt='Image du livre' class='livres-image'></center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['NOM_LIVRE'] . "</center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['TOME'] . "</center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['AUTEUR'] . "</center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['GENRE'] . "</center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['NOTE'] . "</center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['DATE_AJOUT'] . "</center>" . "</a></td>";
            echo "<td>" . "<center>" . $row_recent['PRENOM'] . "</center>" . "</a></td>";
            echo "<td>";
            echo '<button class="retour1" onclick="ouvrirFenetreModale(' . $id_livre . ')">Emprunter</button>';

            ?>

            <div id="modal">
              <form id="form">
                <input type="hidden" name="id_livre" value="<?php echo $id_livre; ?>">

                <label for="DATE_PRET">Date pret :</label>
                <input type="date" id="DATE_PRET" name="DATE_PRET" required><br><br>

                <button class="retour1" type="button" onclick="soumettreFormulaire()">Emprunter ce livre</button>

              </form>
              <button class="retour1" onclick="fermerFenetreModale()">Fermer</button>
            </div>

            <script>
              let IDLIVRE;
              function ouvrirFenetreModale(idLivre) {
                document.getElementById('modal').style.display = 'block';
                IDLIVRE = idLivre;

                let today = new Date();
                let day = today.getDate();
                let month = today.getMonth() + 1;
                let year = today.getFullYear();

                if (day < 10) {
                  day = '0' + day;
                }

                if (month < 10) {
                  month = '0' + month;
                }

                let currentDate = year + '-' + month + '-' + day;
                document.getElementById('DATE_PRET').value = currentDate;
              }

              function fermerFenetreModale() {
                document.getElementById('modal').style.display = 'none';
              }

              function soumettreFormulaire() {
                let date = document.getElementById('DATE_PRET').value;

                if (!date) { alert('date invalide'); return; }
                var formData = new FormData();
                formData.append('id_livre', IDLIVRE);
                formData.append('DATE_PRET', date);


                fetch('emprunter.php', {
                  method: 'POST',
                  body: formData
                })
                  .then(response => response.json())
                  .then(data => {
                    console.log(data)
                    if (data.success) {
                      alert(data.success);
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

            <?php

            echo "</tr>";


          }
      } ?>

      </table>
  </div>
  <footer>
    <div id="bas">
      <p>&copy; 2023 Booky </p>
    </div>
  </footer>
</body>

</html>