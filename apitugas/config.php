<?php
$conn = new mysqli("localhost", "root", "", "pbm_api");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>