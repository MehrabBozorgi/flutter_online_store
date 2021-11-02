<?php
include "connect.php";

$id = $_POST["id"];
$title = $_POST["title"];
$after_price = $_POST["after_price"];
$total = $_POST["total"];
$tedad = $_POST["tedad"];
$date = $_POST["date"];


$sql = "INSERT INTO cart(id,title,after_price,total,tedad,date) values
                    (:id,:title,:after_price,:total,:tedad,:date)";

$res = $connection->prepare($sql);

$res->bindParam(":id", $id);
$res->bindParam(":title", $title);
$res->bindParam(":after_price", $after_price);
$res->bindParam(":total", $total);
$res->bindParam(":tedad", $tedad);
$res->bindParam(":date", $date);
$res->execute();


if ($res) {
    echo '{"result":"ok"}';

} else {
    echo '{"result":"not ok"}';
}