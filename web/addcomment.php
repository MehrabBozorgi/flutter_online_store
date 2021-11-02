<?php
include "connect.php";

$name = $_POST["name"];
$email = $_POST["email"];
$content = $_POST["content"];
$fav = $_POST["fav"];
$product_id = $_POST["product_id"];
$token = $_SERVER["HTTP_TOKEN"];

$query = "SELECT * FROM user WHERE token=:token";
$res = $connection->prepare($query);
$res->bindParam(":token", $token);
$res->execute();
$codes = array();
$row = $res->fetch();
if ($row) {
    $from = $row["id"];

    $sql = "INSERT INTO comment(name,email,content,fav,date,product_id) values
                            (:name,:email,:content,:fav,'1400/4/22',:product_id)";
    $res = $connection->prepare($sql);

    $res->bindParam(":name", $name);
    $res->bindParam(":email", $email);
    $res->bindParam(":content", $content);
    $res->bindParam(":fav", $fav);
    $res->bindParam(":product_id", $product_id);
    $res->execute();

    echo '{"status":"success","message":"نظر شما با موفقیت ثبت شد"}';

} else {
    echo '{"status":"error","message":"invalid token"}';
}

