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
    
            if (password_verify($MDP, $hashedPassword)) {
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
    

}
?>