<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";

$nim = $_POST['nim'] ?? '';
$nama = $_POST['nama'] ?? '';
$kategori = $_POST['kategori'] ?? '';
$deskripsi = $_POST['deskripsi'] ?? '';

if ($nim && $nama && $kategori && $deskripsi) {
    $stmt = $db->prepare("UPDATE hobi SET nama = ?, kategori = ?, deskripsi = ? WHERE nim = ?");
    $result = $stmt->execute([$nama, $kategori, $deskripsi, $nim]);
    echo json_encode(['success' => $result]);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid input']);
}
?>
