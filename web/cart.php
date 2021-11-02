<?php
include "connect.php";
$query="SELECT * FROM cart";
$res=$connection->prepare($query);
$res->execute();
$cart=array();
while($row=$res->fetch(PDO::FETCH_ASSOC)){
    $record=array();
    $record["id"]=$row["id"];
    $record["name"]=$row["name"];
    $record["title"]=$row["title"];
    $record["image"]=$row["image"];
    $record["after_price"]=$row["after_price"];
    $record["befor_price"]=$row["befor_price"];
    $record["total"]=$row["total"];
    $record["tedad"]=$row["tedad"];
    $record["address"]=$row["address"];
    $record["phone"]=$row["phone"];

    $cart[]=$record;
}
echo JSON_encode($cart);