<?php
include "connect.php";

if (!isset($_POST["name"]) || !isset($_POST["email"]) || !isset($_POST["phone"])
    || !isset($_POST["password"]) || !isset($_POST["address"])) {
    echo '{"status":"error","message":"invalid parameters"}';
} else {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];
    $address = $_POST["address"];
    $token = sha1($name . $email . $phone . $address) . md5($password) . sha1(microtime());

    $query = "SELECT * FROM user WHERE email=:email";
    $res = $connection->prepare($query);
    $res->bindParam(":email", $email);
    $res->execute();
    $row = $res->fetchColumn();
    if ($row > 0) {
        echo '{"status":"error","message":"این ایمیل قبلا ثبت شده است"}';
    } else {
        $sql = "INSERT INTO user(name,email,phone,password,address,token) values
                                (:name,:email,:phone,:password,:address,:token)";
        $res = $connection->prepare($sql);
        $res->bindParam(":name", $name);
        $res->bindParam(":email", $email);
        $res->bindParam(":phone", $phone);
        $res->bindParam(":password", $password);
        $res->bindParam(":address", $address);
        $res->bindParam(":token", $token);
        $res->execute();
        echo '{"status":"success","message":"' . $token . '' . $name . ' "}';
    }
}


