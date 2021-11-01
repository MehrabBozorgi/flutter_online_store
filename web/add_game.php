<?php
include "connect.php";

$id = $_POST["id"];
$title = $_POST["title"];
$image = $_POST["image"];
$after_price = $_POST["after_price"];
$befor_price = $_POST["befor_price"];
$description = $_POST["description"];
//$image_id = $_POST["image_id"];
//$comment_id = $_POST["comment_id"];
$year = $_POST["year"];
$kid_age = $_POST["kid_age"];
$size = $_POST["size"];
$tedad = $_POST["tedad"];
//$date = $_POST["date"];


$sql = "INSERT INTO game(id,title,image,after_price,befor_price,description,image_id,comment_id,year,kid_age,size,tedad) values
                    (:id,:title,:image,:after_price,:befor_price,:description,:id,:id,:year,:kid_age,:size,:tedad)";

$res = $connection->prepare($sql);

$res->bindParam(":id", $id);
$res->bindParam(":title", $title);
$res->bindParam(":image", $image);
$res->bindParam(":after_price", $after_price);
$res->bindParam(":befor_price", $befor_price);
$res->bindParam(":description", $description);
//$res->bindParam(":image_id", $image_id);
//$res->bindParam(":comment_id", $comment_id);
$res->bindParam(":year", $year);
$res->bindParam(":kid_age", $kid_age);
$res->bindParam(":size", $size);
$res->bindParam(":tedad", $tedad);
//$res->bindParam(":date", $date);
$res->execute();


if ($res) {
    echo '{"result":"ok"}';

} else {
    echo '{"result":"not ok"}';
}