<?php

include 'bootstrap_db.php';

$postdata = file_get_contents("php://input");

$result = json_decode($postdata);

$id = $result->id;
$completed = $result->completed;

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE order_master SET completed = ('$completed') WHERE idx = ('$id')";
if (!mysqli_query($conn, $sql)) {
    die('Error: ' . mysqli_error($conn));
}
echo "record updated.<br>";