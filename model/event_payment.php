<?php
include_once 'create.php';
include_once '../hj/lp.php';

$data = 0;
$arr = array("data" => $data);

if (isset($_POST)) {

    $array['name']          = security('name');
    $array['event_id']      = security('event_id');
    $array['email']         = $email        = security('email');
    $array['phone_number']  = $phone        = security('phone_number');
    $array['num_ticket']    = $_SESSION['num_ticket']   = security('num_ticket');
    $array['ticket_type']   = $_SESSION['ticket_type']  = security('ticket_type');
    $array['amount']        = $amount = security('amount');

    $array['order_id']  = $rand = rand(100000, 999999);
    $success_url        = '../thanks?my&id=' . security('event_id');
    // $cancel_url         = base_url . 'single_event?id=' . security('event_id') . '&unsuc';
}
$phone = security("phone");

// var_dump($array);

build_sql_insert('event_booking', $array);

$sql = "select * from event_booking where email = '$email' order by id desc";
$_SESSION['bid'] = select_rows($sql)[0]['id'];
$r=pay($amount,$_SESSION['bid'] ,"254".$phone);

$_SESSION['cancel_url'] = $cancel_url;
$name = "Mawingu Camp Kenya";
$htmlContent = file_get_contents("../email/new/skycampbook.php");
$subject = "Mawingu Camp Kenya Booking";


$body .= '<p style="font-family:Montserrat, sans-serif; ">Success. Your booking was successful.</p>';
$body.='<h1>How to pay for the booking</h1>';
$body.='<p>Please note if you have paid you may ignore the following process</p>';
$body.='<p>Go to Mpesa menu and choose paybill</p>';
$body.='<p>Enter the paybill number as:<span style = "color:red">4067387</span></p>';
$body.='<p>Enter the account number as:<span style = "color:red">'.$_SESSION['bid'] .'</span></p>';
$body.='<p>Enter the amount as:<span style = "color:red">'.$amount.'</span></p>';
$body .= $htmlContent;

email($email, $subject, $name, $body);
header("Location: " . $success_url);
exit();