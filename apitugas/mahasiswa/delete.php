<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$nim = $_POST['nim'];
$stmt = $db->prepare("DELETE FROM mahasiswa WHERE nim = ?");
$result = $stmt->execute([$nim]);
echo json_encode([
'nim' => $nim,
'success' => $result
]);
?>