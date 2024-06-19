<?php

include 'header-init.php';
include 'jwt-helper.php';

$user = extractJwtBody();

if ($user->role != "Admin") {
    http_response_code(403);
    echo '{"message" : "Vous n\avez pas les droits nécessaires"}';
    exit();
}
$idUser = $_GET["id"];

$request = $connexion->prepare("SELECT r.justifie, r.retard_date, u.firstname, u.lastname
                                FROM retard AS r
                                JOIN utilisateur AS u ON r.id_user = u.id_user
                                WHERE u.id_user = :id");

$request->execute([
    "id" => $idUser
]);
$retardList = $request->fetchAll();

echo json_encode($retardList);
