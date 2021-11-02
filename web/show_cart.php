<?php
include "connect.php";
$query="SELECT * FROM cart ORDER BY id";
$res=$connection->prepare($query);
$res->execute();
$cart=array();
while($row=$res->fetch(PDO::FETCH_ASSOC)){
    $record=array();
    $record["id"]=$row["id"];
    $record["total_price"]=$row["total_price"];
    $record["total_off_price"]=$row["total_off_price"];
    $record["date"]=$row["date"];
    $record["title"]=$row["title"];
    $record["tedad"]=$row["tedad"];
    $record["image"]=$row["image"];

    $cart[]=$record;
}
echo JSON_encode($cart);