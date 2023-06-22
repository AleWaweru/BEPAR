<?php 
include_once 'read.php'; 
include_once '../hj/lp.php';
$num_row    = get_cart_num($_SESSION['id']);
$cart_row   = get_cart_details($_SESSION['id']);
$total = 0;
foreach($cart_row as $item){
    $total+=$item['cart_price'];
}

build_sql_insert('orders',array(
    "order_status"=>"confirmed","user_id"=>$_SESSION['id'],"total_cost"=>$total));
$arr = array();
$sql = "select * from orders order by date_created desc";
$row = select_rows($sql)[0];
$oid = $row['id'];
foreach($_POST as $key=>$value){
    $_POST[$key] = security($key);
}

$phone = $_POST['phone'];
unset($_POST['phone']);
pay($total,$oid,"254".$phone);
$arr = $_POST;
foreach($cart_row as $item){
    
    $arr['uid'] = $_SESSION['id'];
    $arr['oid'] = $oid;
    $arr['pid'] = $item['product_id'];
    $arr['total_price'] = $item['cart_price'];
    $arr['quantity'] = $item['cart_quantity'];
    $arr['payment_status'] = "paid";
    build_sql_insert("suborders",$arr);
}

$sql1 = "SELECT * FROM orders WHERE user_id = '$_SESSION[id]' ORDER BY date_created DESC";
$row1 = select_rows($sql1)[0];

$name = "Mawingu Camp Kenya";
$subject = "Purchase Successful";
$body = "Your product purchase was successful.
Thank you for doing business with Mawingu Camp Kenya";
$body.='<h1>How to pay for the booking</h1>';
$body.='<p>Please note if you have paid you may ignore the following process</p>';
$body.='<p>Go to Mpesa menu and choose paybill</p>';
$body.='<p>Enter the paybill number as:<span style = "color:red">4067387</span></p>';
$body.='<p>Enter the account number as:<span style = "color:red">'.$oid.'</span></p>';
$body.='<p>Enter the amount as:<span style = "color:red">'.$total.'</span></p>';

email($arr['email'], $subject, $name, $body);
delete('cart', $_SESSION['id'], 'user_id');
header("Location:../thanks.php?id=".$row1['id'] );
