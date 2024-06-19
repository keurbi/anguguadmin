<?php

include 'header-init.php';
include 'jwt-helper.php';

$user = extractJwtBody();

if ($user->role != "Admin") {
    http_response_code(403);
    echo '{"message" : "Vous n\avez pas les droits nécessaires"}';
    exit();
}

if (!isset($_GET['id'])) {
    echo '{"message" : "il n\'y a pas d\'identiant dans l\'URL"}';
    http_response_code(400);
    exit;
}

$idUser = $_GET["id"];

$requete = $connexion->prepare("SELECT u.email, u.id_user, r.name AS role, u.firstname, u.lastname
                                FROM utilisateur AS u 
                                JOIN role AS r ON u.id_role = r.id_role
                                WHERE u.id_user = ?");
$requete->execute([$idUser]);

$user = $requete->fetch();

if (!$user) {
    echo json_encode(["message" => "utilisateur inexistant"]);
    http_response_code(404);
    exit;
}

echo json_encode($user);
