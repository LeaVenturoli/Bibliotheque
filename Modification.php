<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booky - Modification</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header>
        <h1>Modifier un livre</h1>
        <form action="bibliotheque_personnelle.php">
            <a href="deconnexion.php" id="deco">Déconnexion</a><br><br>
            <input class="retour" type="submit" value="Retour">
        </form>
    </header>

    <?php

    require_once ("bdd.php");

    if (isset($_GET['id'])) {
        $id_livre = $_GET['id'];

        $sql = "SELECT * FROM livres WHERE ID = $id_livre";
        $result = $connexion->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $nom_livre = $row['NOM_LIVRE'];
            $tome = $row['TOME'];
            $auteur = $row['AUTEUR'];
            $editions = $row['EDITIONS'];
            $genre = $row['GENRE'];
            $note = $row['NOTE'];

            ?>
            <center>
                <br><br><br>
                <p> Titre, Auteur, édition et genre écrire en lettre uniquement </p>
            </center>
            <div class="contour2">
                <center>
                    <form action="traitement_modif.php" method="post">
                        <input type="hidden" name="id_livre" value="<?php echo $id_livre; ?>">

                        <label for="nom_livre">Nom du livre:</label>
                        <input type="text" name="nom_livre" id="nom_livre" value="<?php echo $nom_livre; ?>"><br><br>

                        <label for="tome">Tome:</label>
                        <input type="text" name="tome" value="<?php echo $tome; ?>"><br><br>

                        <label for="auteur">Auteur:</label>
                        <input type="text" name="auteur" value="<?php echo $auteur; ?>"><br><br>

                        <label for="editions">Edition:</label>
                        <input type="text" name="editions" value=" <?php echo $editions; ?>"><br><br>

                        <label for="genre">Genre:</label>
                        <select name="GENRE" id="GENRE">
                            <option value=""> Faites votre choix</option>
                            <?php
                            $genres = array(
                                "Roman de littérature contemporaine",
                                "Roman sentimental",
                                "Roman de mœurs",
                                "Roman jeunesse",
                                "Roman d’apprentissage",
                                "Roman d’anticipation ou de science-fiction",
                                "Roman Fantasy",
                                "Roman d’aventure",
                                "Roman humoristique",
                                "Roman philosophique",
                                "Roman policier",
                                "Roman Noir",
                                "Roman Thriller",
                                "Roman historique",
                                "Roman d’horreur",
                                "Roman feel-good",
                                "Le conte",
                                "La nouvelle",
                                "Le scénario",
                                "L’auto-biographie",
                                "La biographie",
                                "Le Memoir",
                                "Le livre religieux",
                                "La bande-dessinée",
                                "Le Manga",
                                "La fable",
                                "Récits de voyage",
                                "Mémoires",
                                "Correspondances",
                                "Poésie en prose",
                                "Poésie en vers",
                                "Chanson",
                                "Ballade",
                                "Calligramme",
                                "Chant Royal",
                                "Épigramme",
                                "Ode",
                                "Tragédie",
                                "Comédie",
                                "Drame",
                                "Farce",
                                "Le guide pratique",
                                "L’essai",
                                "Le pamphlet",
                                "Livres de recettes de cuisine",
                            );

                            foreach ($genres as $genre_option) {
                                $selected = ($genre === $genre_option) ? "selected" : "";
                                echo "<option value=\"$genre_option\" $selected>$genre_option</option>";
                            }
                            ?>
                        </select>
                        <br><br>

                        <label for="editions">Edition:</label>
                        <input type="text" name="editions" value=" <?php echo $editions; ?>"><br><br>

                        <label for="NOTE">Note :</label>
                        <input type="number" name="NOTE" max="10" value="<?php echo $note; ?>"><br><br>

                        <input type="submit" value="Enregistrer les modifications">
                    </form>
                </center>
            </div>
            <?php

        } else {
            echo "Livre non trouvé.";
        }
    } else {
        echo "Identifiant du livre non spécifié.";
    }

    ?>

    <footer id="bas1">
        <div>
            <p>&copy; 2023 Booky </p>
        </div>
    </footer>
</body>

</html>