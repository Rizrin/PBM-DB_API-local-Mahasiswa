<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$nim= $_POST['nim'];
$nama= $_POST['nama'];
$kategori= $_POST['kategori'];
$deskripsi= $_POST['deskripsi'];
$stmt = $db->prepare("INSERT INTO hobi (nim, nama, kategori, deskripsi) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$nim, $nama, $kategori, $deskripsi]);
echo json_encode(['success' => $result]);
?>