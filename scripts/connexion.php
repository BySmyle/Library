<?php
include('./lienBDD.php');
$email = $_POST['email'];
$mdp = hash('sha256', $_POST['mdp'] . $sel);
$requete= $connexion->prepare("SELECT * FROM Utilisateur WHERE Email = ?");
$requete->bindParam(1, $email);
$requete->execute();
$result = $requete->fetch();
$nbUti = $requete->rowCount();
if($nbUti == 0){
    header('Location: login.php?error=1');
}
if($result['Mdp'] == $mdp){
    session_start();
    $_SESSION['user_id'] = $result['IdUtilisateur'];
    header('Location: ../index.php');
} else {
    header('Location: ../connexion.html?error=1');
}