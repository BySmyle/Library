<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: ./connexion.html');
    exit();
}
include ('./scripts/lienBDD.php');

$formats = $connexion->query("SELECT * FROM Format")->fetchAll();

$maisons_edition = $connexion->query("SELECT * FROM MaisonEdition")->fetchAll();
?>

<h1>Ajouter une annonce</h1>
<form method="POST" action="./scripts/ajoutAnnonce.php">
    <label for="titre">Titre de l'annonce:</label>
    <input type="text" id="titre" name="titre" required>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea>

    <label for="image">Lien image:</label>
    <input type="text" id="image" name="image">

    <label for="type">Type:</label>
    <select id="type" name="type" required>
        <option value="vente">Vente</option>
        <option value="location">Location</option>
        <option value="echange">Échange</option>
    </select>

    <div id="prix-container">
        <label for="prix">Prix:</label>
        <input type="number" id="prix" name="prix" step="0.01">
    </div>

    <div id="duree-container">
        <label for="duree">Durée maximale (jours):</label>
        <input type="number" id="duree" name="duree">
    </div>

    <label for="isbn">ISBN de l'ouvrage:</label>
    <input type="text" id="isbn" name="isbn" required>

    <button type="submit">Ajouter l'annonce</button>
</form>

<script>
document.getElementById('type').addEventListener('change', function() {
    var type = this.value;
    if (type != 'achat') {
        document.getElementById('prix-container').style.display = 'block';
    } else {
        document.getElementById('prix-container').style.display = 'none';
    }
    if (type == 'location') {
        document.getElementById('duree-container').style.display = 'block';
    } else {
        document.getElementById('duree-container').style.display = 'none';
    }
});
</script>


<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 20px;
}

h1 {
    text-align: center;
    color: #333;
}

form {
    max-width: 600px;
    margin: 0 auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #555;
}

input[type="text"],
input[type="number"],
textarea,
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

textarea {
    height: 100px;
    resize: vertical;
}

button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 15px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
    width: 100%;
}

button:hover {
    background-color: #0056b3;
}
    
</style>