<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Booky</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
</head>

<body>

    <header>
        <h1>Ajouter un Livre</h1>
        <form action="session.php">
            <a href="deconnexion.php" id="deco">Déconnexion</a><br><br>
            <input class="retour" type="submit" value="Retour">
        </form>
    </header>
    <br><br>

    <?php
session_start();
require_once ("bdd.php");

    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    function isPostRequest()
    {
        return $_SERVER["REQUEST_METHOD"] === "POST";
    }


    if (isPostRequest() && isset($_POST['AUTEUR'])) {
        $titre = $_POST["NOM_LIVRE"];
        $tome = isset($_POST["TOME"]) && $_POST["TOME"] !== "" ? floatval($_POST["TOME"]) : null;
        $auteur = $_POST["AUTEUR"];
        $genre = $_POST["GENRE"];
        $editions = $_POST["EDITIONS"];
        $note = isset($_POST["NOTE"]) && $_POST["NOTE"] !== "" ? floatval($_POST["NOTE"]) : null;


        $date = $_POST["DATE_AJOUT"];
        $id_perso = $_SESSION["ID_UTILISATEUR"];
        $souhait = isset($_POST['SOUHAIT']) ? 1 : 0;
        $date = $_POST["DATE_AJOUT"];
        $imageFileName = $_FILES['IMAGES']['name'];
        $uploadDir = './images-livres/';
        $uploadFile = $uploadDir . $imageFileName;
        move_uploaded_file($_FILES['IMAGES']['tmp_name'], $uploadFile);

        $sql = "INSERT INTO livres (NOM_LIVRE, TOME, AUTEUR, GENRE, EDITIONS, NOTE, DATE_AJOUT, ID_UTILISATEUR, IMAGES, SOUHAIT) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connexion->prepare($sql);

        if ($stmt) {

            $stmt->bind_param("ssssssssss", $titre, $tome, $auteur, $genre, $editions, $note, $date, $id_perso, $imageFileName, $souhait);

            if ($stmt->execute()) {
                echo "<div class='retour'>Livre ajouté avec succès</div>";
            } else {
                echo "Erreur lors de l'exécution de la requête : " . $stmt->error;
            }

            $stmt->close();
        } else {
            echo "Erreur lors de la préparation de la requête : " . $connexion->error;
        }
    }

    $connexion->close();

    ?>
    
    <center>
        <br>
        <div class="contour-1">
            <form action="ajouter_livre.php" method="post" enctype="multipart/form-data">
                <p> Titre, Auteur, édition et genre écrire en lettre uniquement </p>
                <label for="NOM_LIVRE">Titre :</label>
                <input type="text" id="NOM_LIVRE" name="NOM_LIVRE" required><br><br>

                <label for="TOME">Tome :</label>
                <input type="text" id="TOME" name="TOME"><br><br>

                <label for="AUTEUR">Auteur :</label>
                <input type="text" id="AUTEUR" name="AUTEUR" required><br><br>

                <label for="EDITIONS">Edition:</label>
                <input type="text" id="EDITIONS" name="EDITIONS" required><br><br>

                <label for="GENRE">Genre :</label>
                <select name="GENRE" id="GENRE">
                    <option value=""> Faites votre choix</option>
                    <option value="Roman de littérature contemporaine"> Roman de littérature contemporaine</option>
                    <option value="Roman sentimental"> Roman sentimental</option>
                    <option value="Roman de mœurs">Roman de mœurs</option>
                    <option value="Roman jeunesse"> Roman jeunesse</option>
                    <option value="Roman d’apprentissage"> Roman d’apprentissage</option>
                    <option value="Roman d’anticipation ou de science-fiction"> Roman d’anticipation ou de
                        science-fiction</option>
                    <option value="Roman Fantasy"> Roman Fantasy</option>
                    <option value="Roman d’aventure"> Roman d’aventure</option>
                    <option value="Roman humoristique"> Roman humoristique</option>
                    <option value="Roman philosophique"> Roman philosophique</option>
                    <option value="Roman policier"> Roman policier</option>
                    <option value="Roman Noir"> Roman Noir</option>
                    <option value="Roman Thriller"> Roman Thriller</option>
                    <option value="Roman historique">Roman historique</option>
                    <option value="Roman d’horreur"> Roman d’horreur</option>
                    <option value="Roman feel-good"> Roman feel-good</option>
                    <option value="Le conte">Le conte</option>
                    <option value="La nouvelle"> La nouvelle</option>
                    <option value="Le scénario"> Le scénario</option>
                    <option value="L’auto-biographie">L’auto-biographie</option>
                    <option value="La biographie">La biographie</option>
                    <option value="Le Memoir">Le Memoir</option>
                    <option value="Le livre religieux">Le livre religieux</option>
                    <option value="La bande-dessinée">La bande-dessinée</option>
                    <option value="Le Manga">Le Manga</option>
                    <option value="La fable">La fable</option>
                    <option value="Récits de voyage">Récits de voyage</option>
                    <option value="Mémoires">Mémoires</option>
                    <option value="Correspondances">Correspondances</option>
                    <option value="Poésie en prose">Poésie en prose</option>
                    <option value="Poésie en vers">Poésie en vers</option>
                    <option value="Chanson">Chanson</option>
                    <option value="Ballade">Ballade</option>
                    <option value="Calligramme">Calligramme</option>
                    <option value="Chant Royal">Chant Royal</option>
                    <option value="Épigramme">Épigramme</option>
                    <option value="Ode">Ode</option>
                    <option value="Tragédie">Tragédie</option>
                    <option value="Comédie">Comédie</option>
                    <option value="Drame">Drame</option>
                    <option value="Farce">Farce</option>
                    <option value="Le guide pratique">Le guide pratique</option>
                    <option value="L’essai">L’essai</option>
                    <option value="Le pamphlet">Le pamphlet</option>
                    <option value="Livres de recettes de cuisine">Livres de recettes de cuisine</option>
                </select>
                <br><br>
                <label for="NOTE">Note :</label>
                <input type="number" id="NOTE" name="NOTE" max="10"><br><br>
                <label for="DATE_AJOUT">Date d'ajout :</label>
                <input type="text" id="DATE_AJOUT" name="DATE_AJOUT" value="<?php echo date('Y-m-d'); ?>"
                    readonly><br><br>

                <label for="IMAGES">Choisir une photo :</label>
                <input type="file" id="IMAGES" name="IMAGES"><br><br>
                <label for="SOUHAIT">Livre souhaité :</label>
                <input type="checkbox" id="SOUHAIT" name="SOUHAIT" value="1"><br><br>
                <input type="submit" value="Ajouter">
            </form>


        </div>

        <br>
    </center>

    <footer id="bas1">
        <div>
            <p>&copy; 2023 Booky </p>
        </div>
    </footer>
</body>

</html>