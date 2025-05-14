<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$nim= $_POST['nim'];
$nama= $_POST['nama'];
$prodi= $_POST['prodi'];
$prodi= $_POST['fakultas'];
$stmt = $db->prepare("INSERT INTO mahasiswa (nim, nama, prodi, fakultas) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$nim, $nama, $prodi, $fakultas]);
echo json_encode(['success' => $result]);
?>