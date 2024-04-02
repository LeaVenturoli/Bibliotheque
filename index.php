<?php
session_start();
if (isset($_SESSION['ID_UTILISATEUR'])) {
    header('location: session.php');
    exit; // Assure que le script s'arrête après la redirection
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Booky</title>
    <link rel="shortcut icon" href="images\livre.ico" type="image/x-icon">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <script type="text/javascript">
    
		(function () {
			// Replace 'YOUR_PUBLIC_KEY' with your EmailJS public key
			emailjs.init('nQeT2fppl-ZtsO2VV');
		})();
	</script>
	  <script type="text/javascript">
        function sendemail(email) {
            // Replace 'contact_service' and 'contact_form' with your EmailJS service and template IDs

            emailjs.send("service_impwdml","template_kmqtyvr",{
                    to_email: email,
                }).then(function(error) {
                    console.log('FAILED...', error);
                });
        };
    </script>
    <style>
        body {
            background-image: url('./images/image-fond.png');
            background-repeat: no-repeat;
            background-size: auto;
            background-size: cover;
        }
    </style>
</head>

<body>
    <center>
        <div class="contourbvn">
            <h2>Inscription</h2>
            <form method="POST" action="inscription.php">
                <input type="text" name="nom" id="nom" placeholder="Nom" required><br><br>
                <input type="text" name="prenom" id="prenom" placeholder="Prénom" required><br><br>
                <input type="email" name="mail" id="mail" placeholder="Mail" required><br><br>
                <input type="password" name="MDP" id="MDP" placeholder="Mot de passe" required><br><br>
                <input type="submit" value="S'inscrire">
            </form>

                        <?php
            if (isset($_GET['m'])) {
                echo $_GET['m'];
                
                ?>
                <script>console.log('send'); sendemail("<?php echo $_GET['email'].'';?>");</script>
               
                <?php
            }

            if (isset($_GET['n'])) {
                echo $_GET['n'];
            }
            ?>


        <h2>Connexion</h2>
        <form method="POST" action="connexion.php">
            <input type="email" name="mail" id="mail" placeholder="Mail" required><br><br>
            <input type="password" name="MDP" id="MDP" placeholder="Mot de passe" required><br><br>
            <input type="submit" value="Connexion">
        </form>
    </div>
        </div>
    </center>
</body>

</html>