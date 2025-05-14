<?php
header('Content-Type: application/json');
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";
$nim = $_POST['id'];
$stmt = $db->prepare("DELETE user hobi WHERE id = ?");
$result = $stmt->execute([$id]);
echo json_encode([
'id' => $id,
'success' => $result
]);
?>