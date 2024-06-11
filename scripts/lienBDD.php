<?php
$host = "mysql-e5prze.alwaysdata.net";
$utilisateur = "e5prze";
$mdp = "LbfQPZ=99z;3h9^Wm(8}";
$nomBDD = "e5prze_library";
$sel = "6;GXxX^6WaY!+zf7VKs{#78tidz5DB_99Fi9$]:4";

try {
    $connexion = new PDO("mysql:host=$host;dbname=$nomBDD", $utilisateur, $mdp);
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection ratée : " . $e->getMessage();
}
?>