<?php
include_once 'operations.php';
include_once 'create.php';
include_once '../hj/lp.php';
foreach($_POST as $key=>$value){
    $_POST[$key] = security($key);
}


if(!isset($_SESSION['id'])){
    exit();
}

// to do
$name = [];
if(isset($_POST['name'])){
$name = $_POST['name'];
$email = $_POST['email'];
$id_no = $_POST['id_no'];

unset($_POST['name']);
unset($_POST['email']);
unset($_POST['id_no']);
}

// end to do

//dd-mm-yyyy
$dt = explode("-",$_POST['date_picked']);
$_POST['date_picked'] = $dt[2]."-".$dt[1]."-".$dt[0];

$_POST['userid'] = $_SESSION['id'];
$_POST['deposit_paid'] = $_POST['amount'] /2;
$_POST['payment_status'] = "not_paid";
$_POST['id'] = create_id('booking_camping', 'id');
$phone = $_POST['phone'];
unset($_POST['phone']);


function get_booking_detailz($id)
{
    $sql = "SELECT name FROM tandem WHERE id='$id' UNION ALL SELECT name FROM yoga WHERE id='$id' UNION ALL SELECT name FROM camping WHERE id='$id' UNION ALL SELECT name FROM biking WHERE id='$id'";
    return select_rows($sql)[0];
}
$activity_name = get_booking_detailz($_POST['activity_id']);
$activity = $activity_name['name'];

pay($_POST['deposit_paid'],$_POST['id'],"254".$phone);
build_sql_insert("booking_camping",$_POST);

//to do
$bid = $_POST['id'];

foreach($name as $key=>$item){
    $arr = array(
        "name"=>$item,
        "email"=>$email[$key],
        "id_no"=>$id_no[$key],
        "btable"=>"booking_camping",
        "bid"=>$bid
        );
    build_sql_insert("people",$arr);    
}

//end to do


$sql = "SELECT * FROM user WHERE id = '$_SESSION[id]' ";
$rowz = select_rows($sql)[0];

$name_person = $rowz['name'];
$date = $_POST['date_picked'];

$sql5 = "SELECT * FROM email_content WHERE id= '1'";
$row5 = select_rows($sql5)[0];

$name = "Mawingu Camp Kenya";
$htmlContent = file_get_contents("../email/new/skycampbook.php");
$subject = "Mawingu Camp Kenya Booking";


$body.= '<p style="font-family:Montserrat, sans-serif; "> '. $row5['email_body'] .' </p>';

$body.='

<h4>Your Booking Summary:</h4>

<ul style = "
  background: #F15412;
  padding: 20px;
  list-style-type: none;
">
  <li style = "
  color: white;
  margin: 5px">Name: '.$name_person. ' </li>
  <li style = "
  color: white;
  margin: 5px">Booking date: '.$date. '</li>
  <li style = "
  color: white;
  margin: 5px">Activity: '.$activity. '</li>
 </ul>
';


$body.='<h1>How to pay for the booking</h1>';
$body.='<p>Please note if you have paid you may ignore the following process</p>';
$body.='<p>Go to Mpesa menu and choose paybill</p>';
$body.='<p>Enter the paybill number as:<span style = "color:red">4067387</span></p>';
$body.='<p>Enter the account number as:<span style = "color:red">'.$_POST['id'].'</span></p>';
$body.='<p>Enter the amount as:<span style = "color:red">'.$_POST['deposit_paid'].'</span></p>';
$body .= $htmlContent;

email($rowz['email'], $subject, $name, $body,true);
email('skyremyservices@gmail.com', $subject, $name, $body,true);

header('location:../thankyou?id=' .$_POST['id']);
//link to success page