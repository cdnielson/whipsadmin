<?php

include 'bootstrap_db.php';

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = mysqli_query($conn, "SELECT * FROM order_master");
$ordersArray = array();

while($row = mysqli_fetch_array($result)) {
    array_push($ordersArray, array(
        'idx' => $row['idx'],
        'lastname' => $row['lastname'],
        'firstname' => $row['firstname'],
        'currency' => $row['currency'],
        'shipping' => $row['shipping'],
        'total' => $row['total'],
        'paid' => $row['paid'],
        'completed' => $row['completed']));
}

$data = json_encode($ordersArray);

echo $data;