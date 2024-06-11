<?php 
include ('./scripts/lienBDD.php'); ?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
</head>

<?php
$sql = "SELECT * FROM Annonce A 
INNER JOIN Image I ON A.IdAnnonce = I.IdAnnonce 
WHERE A.IdAnnonce = ". $_POST['idAnnonce'] ." AND A.IdAnnonce = I.IdAnnonce ";
$requete = $connexion->prepare($sql);
$requete->execute();
$annonces = $requete->fetchAll();

$sql = " SELECT 
    a.IdAnnonce,
    CASE 
        WHEN v.IdAnnonce IS NOT NULL THEN 'Vente'
        WHEN l.IdAnnonce IS NOT NULL THEN 'Location'
        WHEN e.IdAnnonce IS NOT NULL THEN 'Echange'
    END AS typeAnnonce,
    CASE 
        WHEN v.IdAnnonce IS NOT NULL THEN v.Prix
        WHEN l.IdAnnonce IS NOT NULL THEN l.Prix
        ELSE NULL
    END AS prix
FROM 
    Annonce a
LEFT JOIN 
    Vente v ON a.IdAnnonce = v.IdAnnonce
LEFT JOIN 
    Location l ON a.IdAnnonce = l.IdAnnonce
LEFT JOIN 
    Echange e ON a.IdAnnonce = e.IdAnnonce;

";
$requete = $connexion->prepare($sql);
$requete->execute();
$typeAnnonce = $requete->fetchAll();


echo '<h1>Annonces '. $_POST['idAnnonce'] .'</h1>';
$i = 0;
foreach ($annonces as $annonce) {
    echo '<tr><div id="lesAnnonces">
        <td><img src="' . $annonces[$i]["LienImage"] . '"/></td>
        <td><p>' . $annonces[$i]["Titre"] . '</p>
        <td><p>' . $annonces[$i]["Description"] . '</p>
        <td><p>' . $typeAnnonce[$i]["typeAnnonce"] . '</p>
        <td><p>' . $typeAnnonce[$i]["prix"] . ' €</p>
        <form action="./consulAnnonce.php" method="post">
            <input type="texte" name="Message"/>
        <td><button id="consulter">Envoyer</button></td>
        </form>
        </div>
    </tr>';
    $i++;
} ?>
</table>