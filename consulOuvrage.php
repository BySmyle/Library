<?php 
include ('./scripts/lienBDD.php'); ?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
</head>

<?php
$sql = " SELECT 
    o.ISBN,
    o.Titre,
    o.NumTome,
    o.Resume,
    o.LienImageCouverture,
    f.LibelFormat,
    m.LibelMaisonEdit,
    GROUP_CONCAT(DISTINCT a.LibelAuteur SEPARATOR ', ') AS Auteurs,
    GROUP_CONCAT(DISTINCT g.LibelGenre SEPARATOR ', ') AS Genres
FROM 
    Ouvrage o
JOIN 
    Format f ON o.IdFormat = f.IdFormat
JOIN 
    MaisonEdition m ON o.IdMaisonEdit = m.IdMaisonEdit
LEFT JOIN 
    Concevoir c ON o.ISBN = c.ISBN
LEFT JOIN 
    Auteur a ON c.IdAuteur = a.IdAuteur
LEFT JOIN 
    Genrer gnr ON o.ISBN = gnr.ISBN
LEFT JOIN 
    Genre g ON gnr.IdGenre = g.IdGenre
WHERE 
    o.ISBN =". $_POST['ISBN']. "";
$requete = $connexion->prepare($sql);
$requete->execute();
$ouvrages = $requete->fetchAll();


echo '<h1>Ouvrage</h1>';
$i = 0;
foreach ($ouvrages as $ouvrage) {
    echo '<tr><tables id="lesAnnonces">
<td><img src="' . $ouvrages[$i]["LienImageCouverture"] . '"/></td>
            <td><p>' . $ouvrages[$i]["ISBN"] . '</p>
            <td><p>' . $ouvrages[$i]["Titre"] . '</p>
            <td><p>' . $ouvrages[$i]["Resume"] . '</p>
            <td><p>' . $ouvrages[$i]["NumTome"] . '</p>
            <td><p>' . $ouvrages[$i]["LibelFormat"] . '</p>
            <td><p>' . $ouvrages[$i]["LibelMaisonEdit"] . '</p>
            <td><p>' . $ouvrages[$i]["Auteurs"] . '</p>
            <td><p>' . $ouvrages[$i]["Genres"] . '</p>
    </tr>';
    $i++;
} ?>
</table>