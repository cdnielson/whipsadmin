<?php

include 'bootstrap_db.php';

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = mysqli_query($conn, "SELECT * FROM order_items");
$orderItemsArray = array();

while($row = mysqli_fetch_array($result)) {
    array_push($orderItemsArray, array(
        'idx' => $row['idx'],
        'order_idx' => $row['order_idx'],
        'description' => $row['description'],
        'material' => $row['material'],
        'length' => $row['length'],
        'price' => $row['price'],
        'quantity' => $row['quantity']));
}

$data = json_encode($orderItemsArray);

echo $data;