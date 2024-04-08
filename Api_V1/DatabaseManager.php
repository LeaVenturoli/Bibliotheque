<?php
class DatabaseManager {
    private $connection;

    public function __construct() {
        $config = include('database.php');
        $this->connection = new mysqli($config['host'], $config['username'], $config['password'], $config['database']);
        if ($this->connection->connect_error) {
            throw new Exception("Erreur de connexion à la base de données : " . $this->connection->connect_error);
        }
    }

    // public function createUser($username, $userPassword) {
    //     $hashedPassword = password_hash($userPassword, PASSWORD_DEFAULT); // Use password_hash for security

    //     $stmt = $this->connection->prepare("INSERT INTO users (username, userPassword) VALUES (?, ?)");
    //     $stmt->bind_param("ss", $username, $hashedPassword);
    //     if ($stmt->execute()) {
    //         $stmt->close();
    //         return true;
    //     } else {
    //         $stmt->close();
    //         throw new Exception("Erreur lors de la création de l'utilisateur : " . $this->connection->error);
    //     }
    // }



    public function connectUser($MAIL, $MDP) {
        $stmt = $this->connection->prepare("SELECT * FROM utilisateurs WHERE MAIL = ?");
        $stmt->bind_param("s", $MAIL);
        $stmt->execute();
        $result = $stmt->get_result();
    
        if ($result && $result->num_rows > 0) {
            $user = $result->fetch_assoc();
            $hashedPassword = $user['MDP'];
            $hashedInputPassword = hash('sha256', $MDP); 
    
            if ($hashedInputPassword === $hashedPassword) {
                $stmt->close();
                return $user; 
            } else {
                $stmt->close();
                return false; 
            }
        } else {
            $stmt->close();
            return false; 
        }
    } 

    public function getLivre($ID_UTILISATEUR) {
        $stmt = $this->connection->prepare("SELECT * FROM livres WHERE ID_UTILISATEUR = ? AND SOUHAIT = 0");
        $stmt->bind_param("i", $ID_UTILISATEUR);
        $stmt->execute();
        $result = $stmt->get_result();
        
        $livres = array(); 
        
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $livre = array(
                    "ID_LIVRE" => $row["ID"],
                    "NOM_LIVRE" => $row["NOM_LIVRE"],
                    "TOME" => $row["TOME"],
                    "AUTEUR" => $row["AUTEUR"]
                );
                $livres[] = $livre;
            }
        }

        return json_encode(array("success" => true, "livres" => $livres));
    }

    public function postLivre() {
        // Insertion d'un livre dans la base de données
    }
    

    public function souhaitLivre($userID){
        $stmt = $this->connection->prepare("SELECT * FROM livres WHERE ID_UTILISATEUR = ? AND SOUHAIT = 1");
        $stmt->bind_param("i", $userID); // i pour un entier
        $stmt->execute();
        $result = $stmt->get_result();
        
        $livres = array(); 
        
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $livre = array(
                    "ID_LIVRE" => $row["ID"],
                    "NOM_LIVRE" => $row["NOM_LIVRE"],
                    "TOME" => $row["TOME"],
                    "AUTEUR" => $row["AUTEUR"]
                );
                $livres[] = $livre;
            }
        }
        return json_encode(array("success" => true, "livres" => $livres));
    }

    public function nombreLivre($userId) {
        // Assurez-vous d'ajuster cette requête en fonction de votre schéma de base de données
        $query = "SELECT COUNT(*) AS nombre_livres FROM livres WHERE ID_UTILISATEUR = ? AND SOUHAIT = 0";
        
        // Préparation de la requête
        $stmt = $this->connection->prepare($query);
        
        // Liaison des paramètres
        $stmt->bind_param("i", $userId);
        
        // Exécution de la requête
        if($stmt->execute()) {
            // Récupération du résultat
            $result = $stmt->get_result();
            
            // Vérification s'il y a des lignes retournées
            if($result->num_rows == 1) {
                // Récupération du nombre de livres
                $row = $result->fetch_assoc();
                $nombreLivre = $row['nombre_livres'];
                
                // Retourner le nombre de livres
                return $nombreLivre;
            } else {
                // En cas d'erreur ou de résultat non trouvé
                return false;
            }
        } else {
            // En cas d'échec de l'exécution de la requête
            return false;
        }
    }
    
}
?>
