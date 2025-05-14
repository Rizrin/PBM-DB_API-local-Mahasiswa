<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$stmt = $db->prepare("SELECT nama, kategori, deskripsi, FROM hobi");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
?>