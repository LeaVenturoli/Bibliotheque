<?php
session_start();
require_once ("bdd.php");

if (isset($_SESSION['ID_UTILISATEUR'])) {
    $id_perso = $_SESSION["ID_UTILISATEUR"];
    $ID = $_POST['id_livre'];
    $date = date("d-m-Y");

    $selectLivre = $connexion->prepare("SELECT * FROM livres WHERE ID = ? AND EMPRUNT = 0");
    $selectLivre->bind_param("s", $ID);
    $selectLivre->execute();
    $resultLivre = $selectLivre->get_result();

    if ($resultLivre->num_rows > 0) {
        $selectEmprunt = $connexion->prepare("SELECT * FROM emprunt WHERE ID_LIVRE = ? AND ID_UTILISATEUR = ?");
        $selectEmprunt->bind_param("ss", $ID, $id_perso);
        $selectEmprunt->execute();
        $resultEmprunt = $selectEmprunt->get_result();

        if ($resultEmprunt->num_rows > 0) {
            echo json_encode(['error' => 'Vous avez déjà emprunté ce livre']);
        } else {

            while ($row = $resultLivre->fetch_assoc()) {
                $id_livre = $row["ID"];

                $insert = $connexion->prepare("INSERT INTO emprunt (ID_LIVRE,ID_UTILISATEUR,DATE_PRET) VALUES (?,?,?)");
                $insert->bind_param("sss", $id_livre, $id_perso, $date);
                $modif = "UPDATE livres SET EMPRUNT = 1 WHERE ID = $id_livre";
                $connexion->query($modif);

                if ($insert->execute()) {
                    echo json_encode(['success' => 'Livre emprunté avec succès']);


                } else {
                    echo json_encode(['error' => 'Erreur lors de l\'insertion : ' . $insert->error]);
                }
            }
        }

        $selectEmprunt->close();
    } else {
        echo json_encode(['error' => 'Aucun résultat trouvé pour l\'ID : ' . $ID]);
    }

    $selectLivre->close();
    $connexion->close();
}
?>