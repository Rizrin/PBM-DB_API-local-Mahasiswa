<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$nim= $_POST['nim'];
$nama= $_POST['nama'];
$kategori= $_POST['kategori'];
$deskripsi= $_POST['deskripsi'];
$stmt = $db->prepare("INSERT INTO user (id, username, password) VALUES (?, ?, ?)");
$result = $stmt->execute([$id, $username, $password]);
echo json_encode(['success' => $result]);
?>