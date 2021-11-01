<?php
include "connect.php";

$title = $_POST["title"];
$tedad = $_POST["tedad"];
$image = $_POST["image"];
$total_price = $_POST["total_price"];
$total_off_price = $_POST["total_off_price"];

//$date = $_POST["date"];


$sql = "INSERT INTO cart (title,tedad,image,total_price,total_off_price,date)
                VALUES (:title,:tedad,:image,:total_price,:total_off_price,'1400/5/23')";

$res = $connection->prepare($sql);

$res->bindParam(":title", $title);
$res->bindParam(":tedad", $tedad);
$res->bindParam(":image", $image);
$res->bindParam(":total_price", $total_price);
$res->bindParam(":total_off_price", $total_off_price);

$res->execute();


if ($res) {
    echo '{"result":"ok"}';

} else {
    echo '{"result":"not ok"}';
}

