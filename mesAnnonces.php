<?php include('./scripts/lienBDD.php');
session_start();
if (!isset($_SESSION['user_id'])) {
    die("Vous devez être connecté pour voir vos annonces.");
}

$user_id = $_SESSION['user_id'];


$sql = "SELECT * FROM Annonce WHERE IdUtilisateur = :user_id";

$requete = $connexion->prepare($sql);
$requete->execute(['user_id' => $user_id]);
$annonces = $requete->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Mes Annonces</title>
</head>
<body>
    <h1>Mes Annonces</h1>
    <?php if (count($annonces) > 0): ?>
        <ul>
            <?php foreach ($annonces as $annonce): ?>
                <li>
                    <h2><?php echo htmlspecialchars($annonce['Titre']); ?></h2>
                    <p><?php echo htmlspecialchars($annonce['Description']); ?></p>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>Aucune annonce trouvée.</p>
    <?php endif; ?>
</body>
</html>
