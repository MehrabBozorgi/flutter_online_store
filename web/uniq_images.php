<?php
include "connect.php";


$id = $_GET["id"];
$query = "SELECT * FROM images WHERE image_id = $id";
$res = $connection->prepare($query);
$res->execute();
$image = array();

while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
    $record=array();

    $record["image_slide"] = $row["image_slide"];
    $image[] = $record;

}


echo json_encode($image);