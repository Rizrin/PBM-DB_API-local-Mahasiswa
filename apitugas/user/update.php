<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";

$id = $_POST['id'] ?? '';
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if ($id && $username && $password) {
    $stmt = $db->prepare("UPDATE user SET username = ?, password = ?, WHERE id = ?");
    $result = $stmt->execute([$username, $password, $id]);
    echo json_encode(['success' => $result]);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid input']);
}
?>
