<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";

$nim = $_POST['nim'] ?? '';
$nama = $_POST['nama'] ?? '';
$nama_organisasi = $_POST['nama_organisasi'] ?? '';
$thn_bergabung = $_POST['thn_bergabung'] ?? '';

if ($nim && $name && $prodi && $fakultas) {
    $stmt = $db->prepare("UPDATE organisasi SET nama = ?, nama_organiasi = ?, thn_bergabung = ? WHERE nim = ?");
    $result = $stmt->execute([$nama, $nama_organisasi, $thn_bergabung, $nim]);
    echo json_encode(['success' => $result]);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid input']);
}
?>
