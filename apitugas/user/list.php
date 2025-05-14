<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$stmt = $db->prepare("SELECT id, nama, FROM user");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
?>