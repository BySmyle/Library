<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
<div id="barreNav">
    <img id="logo" src="./images/logo.png"/>
    <a href="./annonce.php">Annonces</a>
    <a href="./bibliothequeG.php">Bibliothèque général</a>
    <?php 
    session_start();
    if (isset($_SESSION['user_id'])) {
        echo'<a href="./bibliotheque.php">Ma Bibliothèque</a>
        <a href="./creaAnnonce.php">Créé une annonce</a>
        <a href="./conversation.php">Mes conversations</a>
        <a href="./mesAnnonces.php">Mes annonces</a>
        <a href="./scripts/deconnexion.php">Déconnexion</a>';
        
    }else{
        echo'<a href="./connexion.html">Connexion</a>';
    }
    ?>
    </div>
<h1 id="h1">Bienvenue !</h1>

</body>
</html>
