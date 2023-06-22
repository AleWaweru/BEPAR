<?php
include_once 'operations.php';
include_once 'create.php';
include_once '../hj/lp.php';

if(!isset($_SESSION['id'])){
    exit();
}
$phone = $_POST['phone'];
$sql = "select * from booking where id = '$_POST[id]'";
$row = select_rows($sql);
if(!empty($row)){
$row = $row[0];
$amount = $row['amount'];
pay($amount,$_POST['id']."-full","254".$phone);    
}