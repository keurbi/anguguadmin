<?php

include 'header-init.php';
include 'jwt-helper.php';

$user = extractJwtBody();

if ($user->role != "Admin") {
    http_response_code(403);
    echo '{"message" : "Vous n\avez pas les droits nécessaires"}';
    exit();
}

$request = $connexion->query("SELECT u.email, u.id_user, r.name AS role, u.firstname, u.lastname
                                FROM utilisateur AS u 
                                JOIN role AS r ON u.id_role = r.id_role");

$userList = $request->fetchAll();

echo json_encode($userList);
