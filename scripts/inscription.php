<?php
include('./lienBDD.php');
$email = $_POST['email'];
$pseudo = $_POST['pseudo'];
$prenom = $_POST['prenom'];
$nom = $_POST['nom'];
$tel = $_POST['tel'];
$mdp = hash('sha256', $_POST['mdp']);

$sql = "INSERT INTO Utilisateur (Email, Pseudo, Prenom, Nom, Tel, Mdp, Certifie)
        VALUES (?, ?, ?, ?, ?, ?, 0)";
$requete = $connexion->prepare($sql);
$requete->execute([$email, $pseudo, $prenom, $nom, $tel, $mdp]);
header('Location: ../connexion.html ');
?>
