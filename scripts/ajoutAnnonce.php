<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: ./connexion.html');
    exit();
}
include('./lienBDD.php');

$titre = $_POST['titre'];
$description = $_POST['description'];
$type = $_POST['type'];
$isbn = $_POST['isbn'];
$id = $_SESSION['user_id'];

    $sql = "INSERT INTO Annonce (Titre, Description, IdUtilisateur) VALUES (?, ?, ?)";
    $requete = $connexion->prepare($sql);
    $requete->execute([$titre, $description, $id]);
    $id_annonce = $connexion->lastInsertId();

    if ($type == 'vente') {
        $prix = $_POST['prix'];
        $sql = "INSERT INTO Vente (IdAnnonce, Prix) VALUES (?, ?)";
        $requete = $connexion->prepare($sql);
        $requete->execute([$id_annonce, $prix]);
    } elseif ($type == 'location') {
        $prix = $_POST['prix'];
        $duree = $_POST['duree'];
        $sql = "INSERT INTO Location (IdAnnonce, Prix, Duree) VALUES (?, ?, ?)";
        $requete = $connexion->prepare($sql);
        $requete->execute([$id_annonce, $prix, $duree]);
    } elseif ($type == 'echange') {
        $duree = $_POST['duree'];
        $sql = "INSERT INTO Echange (IdAnnonce) VALUES (?)";
        $requete = $connexion->prepare($sql);
        $requete->execute([$id_annonce]);

        foreach ($_POST['isbn_echange'] as $isbn_echange) {
            $sql = "INSERT INTO Souhaiter (ISBN, IdAnnonce) VALUES (?, ?)";
            $requete = $connexion->prepare($sql);
            $requete->execute([$isbn_echange, $id_annonce]);
        }
    }
    header('Location: ../index.php');

?>
