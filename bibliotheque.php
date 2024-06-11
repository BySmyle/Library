<?php 
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: ./connexion.html');
    exit();
}
include('./scripts/lienBDD.php');

$id = $_SESSION['user_id'];
$sql = "SELECT * FROM Ouvrage INNER JOIN Exemplaire ON Ouvrage.ISBN = Exemplaire.ISBN WHERE Exemplaire.IdUtilisateur = ?";
$requete = $connexion->prepare($sql);
$requete->bindParam(1, $id);
$requete->execute();
$ouvrages = $requete->fetchAll();
?>
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
</head>
<h1>Ma Bibliothèque</h1>
    <?php foreach ($ouvrages as $ouvrage) { 
         echo'
         <div id="lesAnnonces">
         <tr>
         <td><img src='.$ouvrage["LienImageCouverture"].'></td>
        <td>'.$ouvrage["Titre"].'</td>
         <form action="./consulOuvrage.php" method="post">
                <input name="ISBN" type="hidden" value="'. $ouvrage["ISBN"] .'"/>
            <td><button id="consulter">Consulter</button></td>
    </tr></div>'; } ?>
</table>