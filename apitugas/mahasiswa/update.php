<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";

$nim = $_POST['nim'] ?? '';
$nama = $_POST['nama'] ?? '';
$prodi = $_POST['prodi'] ?? '';
$fakultas = $_POST['fakultas'] ?? '';

if ($nim && $name && $prodi && $fakultas) {
    $stmt = $db->prepare("UPDATE mahasiswa SET nama = ?, prodi = ?, fakultas = ? WHERE nim = ?");
    $result = $stmt->execute([$name, $prodi, $fakultas, $nim]);
    echo json_encode(['success' => $result]);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid input']);
}
?>
