<?php
include "connect.php";
$query="SELECT * FROM game";
$res=$connection->prepare($query);
$res->execute();
$game=array();
while($row=$res->fetch(PDO::FETCH_ASSOC)){
    $record=array();
    $record["id"]=$row["id"];
    $record["size"]=($row["size"]);
    $record["title"]=$row["title"];
    $record["image"]=$row["image"];
    $record["after_price"]=$row["after_price"];
    $record["befor_price"]=$row["befor_price"];
    $record["description"]=$row["description"];
    $record["year"]=$row["year"];
    $record["kid_age"]=$row["kid_age"];
    $record["tedad"]=$row["tedad"];

    $game[]=$record;
}
echo JSON_encode($game);