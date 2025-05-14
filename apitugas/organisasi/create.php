<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$nim= $_POST['nim'];
$nama= $_POST['nama'];
$nama_organisasi= $_POST['nama_organisasi'];
$thn_bergabung= $_POST['thn_bergabung'];
$stmt = $db->prepare("INSERT INTO organisasi (nim, nama, nama_organisasi, thn_bergabung) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$nim, $nama, $nama_organisasi, $thn_bergabung]);
echo json_encode(['success' => $result]);
?>