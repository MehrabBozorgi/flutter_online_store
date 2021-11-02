<?php
include "connect.php";

if (!isset($_POST["email"]) || !isset($_POST["password"])) {
    echo '{"message":"invalid parameters"}';
} else {
    $email = $_POST["email"];
    $password = $_POST["password"];

    $query = "SELECT * FROM user WHERE email=:email AND password=:password";
    $res = $connection->prepare($query);
    $res->bindParam(":email", $email);
    $res->bindParam(":password", $password);
    $res->execute();
    $row = $res->fetch();

    if ($row) {
        echo '{"token":"' . $row["token"] . '"}';
    } else {
        echo '{"message":"ایمیل یا کلمه عبور اشتباه است"}';
    }
}