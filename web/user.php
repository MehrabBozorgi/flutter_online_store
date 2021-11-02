<?php
include "connect.php";
$query="SELECT * FROM user";
$res=$connection->prepare($query);
$res->execute();
$game=array();
while($row=$res->fetch(PDO::FETCH_ASSOC)){
    $record=array();
    $record["id"]=$row["id"];
    $record["name"]=$row["name"];
    $record["email"]=$row["email"];
    $record["phone"]=$row["phone"];
    $record["password"]=$row["password"];
    $record["address"]=$row["address"];
    $record["token"]=$row["token"];

    $game[]=$record;
}
echo JSON_encode($game);