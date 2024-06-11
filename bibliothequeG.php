<?php
include ('./scripts/lienBDD.php'); ?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
</head>

<?php
$sql = "SELECT ISBN, Titre, LienImageCouverture FROM Ouvrage";
$requete = $connexion->prepare($sql);
$requete->execute();
$ouvrages = $requete->fetchAll();

session_start();
echo '<div id="barreNav">
        <img id="logo" src="./images/logo.png"/>
        <a href="./index.php">Accueil</a>
        </div>
    <h1>Bibliothèque publique</h1>';
$i = 0;
foreach ($ouvrages as $ouvrage) {
    echo '<tr><tables id="lesAnnonces">
            <td><img src="' . $ouvrages[$i]["LienImageCouverture"] . '"/></td>
            <td><p>' . $ouvrages[$i]["ISBN"] . '</p>
            <td><p>' . $ouvrages[$i]["Titre"] . '</p>
            <form action="./consulOuvrage.php" method="post">
                <input name="ISBN" type="hidden" value="' . $ouvrages[$i]["ISBN"] . '"/>
            <td><button id="consulter">Consulter</button></td>
            </form>
        </tr>';
    $i++;
} ?>
</table>