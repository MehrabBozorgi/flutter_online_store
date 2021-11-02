<?php
include "connect.php";


$id = $_GET["id"];
$query = "SELECT * FROM comment WHERE product_id = $id";
$res = $connection->prepare($query);
$res->execute();
$comment = array();

while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
    $record = array();

    $record["id"] = $row['id'];
    $record["product_id"] = $row['product_id'];
    $record["fav"] = $row['fav'];
    $record["name"] = $row['name'];
    $record["email"] = $row['email'];
    $record["content"] = $row['content'];
    $record["date"] = $row['date'];
    $comment[] = $record;

}


echo json_encode($comment);