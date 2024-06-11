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
                WHERE A.IdAnnonce = I.IdAnnonce ";
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

    session_start();
    echo '<div id="barreNav">
        <img id="logo" src="./images/logo.png"/>';
    if (isset($_SESSION['user_id'])) {
        echo '<a href="./index.php">Accueil</a>
                    <a href="./creaAnnonce.php">Créé une annonce</a>
                    <a href="./mesAnnonces.php">Mes annonces</a>';

    } else {
        echo '<a href="./index.php">Accueil</a>';
    }
    echo '</div>

    <h1>Annonces Publiques</h1>';
    $i = 0;
    foreach ($annonces as $annonce) {
        echo '<tr><tables id="lesAnnonces">
            <td><img src="' . $annonces[$i]["LienImage"] . '"/></td>
            <td><p>' . $annonces[$i]["Titre"] . '</p>
            <td><p>' . $typeAnnonce[$i]["typeAnnonce"] . '</p>
            <td><p>' . $typeAnnonce[$i]["prix"] . ' €</p>
            <form action="./consulAnnonce.php" method="post">
                <input name="idAnnonce" type="hidden" value="'. $annonces[$i]["IdAnnonce"] .'"/>
            <td><button id="consulter">Consulter</button></td>
            </form>
        </tr>';
        $i++;
    } ?>