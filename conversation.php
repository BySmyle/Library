<?php include('./scripts/lienBDD.php');
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: ./connexion.html');
    exit();
}
$user_id = $_SESSION['user_id'];
$sql = "SELECT DISTINCT IdConversation FROM Message WHERE IdUtilisateur = :user_id
";

$requete = $connexion->prepare($sql);
$requete->execute(['user_id' => $user_id]);
$conversations = $requete->fetchAll(PDO::FETCH_ASSOC);

?>
<head>
<link rel="stylesheet" href="./style.css">
</head>
<body>
    <h1>Vos conversations en cour sur vos offres</h1>
        <?php foreach ($conversations as $conversation){
            
         echo'<div id="conversation">Conversation '.$conversation["IdConversation"]. ' 
         <form action="./maConversation.php" method="post">
            <input type="hidden" name="IdConversation" value="'. $conversation["IdConversation"] .'"/>
            <button>Voir la conversation</button>
         </form></div>';}
?>
<?php
$sql = "
    SELECT DISTINCT 
        c.IdConversation,
        a.Titre AS TitreAnnonce,
        u.Pseudo AS Utilisateur
    FROM 
        Conversation c
    JOIN 
        Annonce a ON c.IdAnnonce = a.IdAnnonce
    JOIN 
        Utilisateur u ON a.IdUtilisateur = u.IdUtilisateur
    WHERE 
        a.IdUtilisateur = :user_id
";

$requete = $connexion->prepare($sql);
$requete->execute(['user_id' => $user_id]);
$conversations = $requete->fetchAll(PDO::FETCH_ASSOC);
?>
    <h1>Conversation en cour sur vos annonces</h1>
    <table border="1">
        <tr>
            <th>ID Conversation</th>
            <th>Titre de l'Annonce</th>
        </tr>
        <?php foreach ($conversations as $conversation){
           echo' <tr>
                <td>'.$conversation["IdConversation"].'</td>
                <td>'.$conversation["TitreAnnonce"].'</td>
                <td>
                    <form action="./maConversation.php" method="POST">
                        <input type="hidden" name="IdConversation" value="'.$conversation["IdConversation"].'">
                        <button type="submit">Voir la conversation</button>
                    </form>
                </td>
            </tr>';
            }?>
    </table>
</body>
</html>
</body>