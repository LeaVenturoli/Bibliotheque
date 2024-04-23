<?php

class DatabaseManager {
    private $connection;

    public function __construct($conn) {
        $this->connection = $conn;
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
                    "AUTEUR" => $row["AUTEUR"],
                    "IMAGE" => $row['IMAGES']
                );
                $livres[] = $livre;
            }
        }

        return json_encode(array("success" => true, "livres" => $livres));
    }

    
    public function postLivre(string $ID_UTILISATEUR, string $titre, ?string $tome, string $auteur, string $genre, string $editions, string $date, bool $souhait, string $imageData): bool {
        $stmt = $this->connection->prepare("INSERT INTO livres (ID_UTILISATEUR, NOM_LIVRE, TOME, AUTEUR, GENRE, EDITIONS, DATE_AJOUT, SOUHAIT, IMAGES) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssssis", $ID_UTILISATEUR, $titre, $tome, $auteur, $genre, $editions, $date, $souhait, $imageData);
        
        if ($stmt->execute()) {
            $stmt->close();
            return true;
        } else {
            $error = $stmt->error;
            $stmt->close();
            throw new Exception("Erreur lors de l'ajout du livre : " . $error);
        }
    }
    
    
    

    public function souhaitLivre($userID){
        $stmt = $this->connection->prepare("SELECT * FROM livres WHERE ID_UTILISATEUR = ? AND SOUHAIT = 1");
        $stmt->bind_param("i", $userID); 
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
        $query = "SELECT COUNT(*) AS nombre_livres FROM livres WHERE ID_UTILISATEUR = ? AND SOUHAIT = 0";
        
        $stmt = $this->connection->prepare($query);
       
        $stmt->bind_param("i", $userId);
      
        if($stmt->execute()) {
            $result = $stmt->get_result();
            
            if($result->num_rows == 1) {
                $row = $result->fetch_assoc();
                $nombreLivre = $row['nombre_livres'];
                
                return $nombreLivre;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    
}
?>