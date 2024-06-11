<?php include("./scripts/lienBDD.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    
    exit();
}

$user_id = $_SESSION['user_id'];

// Vérifiez si l'ID de la conversation est passé en POST
if (!isset($_POST['IdConversation'])) {
    header('Location: ./conversation.php');
}

$idConversation = $_POST['IdConversation'];

$sql = "
    SELECT 
        m.Texte,
        m.DateEnvoie,
        u.Pseudo AS Utilisateur
    FROM 
        Message m
    JOIN 
        Utilisateur u ON m.IdUtilisateur = u.IdUtilisateur
    WHERE 
        m.IdConversation = :idConversation
    ORDER BY 
        m.DateEnvoie ASC
";

$requete = $connexion->prepare($sql);
$requete->execute(['idConversation' => $idConversation]);
$messages = $requete->fetchAll(PDO::FETCH_ASSOC);

if (isset($_POST['new_message'])) {
    $Message = $_POST['new_message'];
    $sql = "
        INSERT INTO Message (Texte, DateEnvoie, IdConversation, IdUtilisateur)
        VALUES (:texte, NOW(), :idConversation, :idUtilisateur)
    ";

    $requete= $connexion->prepare($sql);
    $requetet->execute([
        'texte' => $Message,
        'idConversation' => $idConversation,
        'idUtilisateur' => $user_id
    ]);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Conversation</title>
</head>
<body>
    <h1>Messages de la conversation ID: <?php echo htmlspecialchars($idConversation); ?></h1>
    <table border="1">
        <tr>
            <th>Utilisateur</th>
            <th>Message</th>
            <th>Date d'envoi</th>
        </tr>
        <?php foreach ($messages as $message): ?>
            <tr>
                <td><?php echo htmlspecialchars($message['Utilisateur']); ?></td>
                <td><?php echo htmlspecialchars($message['Texte']); ?></td>
                <td><?php echo htmlspecialchars($message['DateEnvoie']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>

    <h2>Envoyer un nouveau message</h2>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">
        <input type="hidden" name="IdConversation" value="<?php echo htmlspecialchars($idConversation); ?>">
        <input type="text" name="new_message" required>
        <button type="submit">Envoyer</button>
    </form>
</body>
</html>