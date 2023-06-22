<?php

include_once 'read.php';

$arr = array();
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
    case 'register':
        create_user($arr);
        break;
    case 'book':
        create_booking($arr);
        break;
    case 'login':
        get_user_login();
        break;
    case 'falsy':
        login_fallback(decrypt($_GET['email']));
        break;
    case 'contact':
        post_inquiry($arr);
        break;
    case 'contact2':
        post_inquiry2($arr);
        break;
    case 'newsletter':
        post_inquiry3($arr);
        break;
    case 'reset':
        post_password_reset($arr);
        break;
    case 'cart':
        post_cart($arr);
        break;
}




function create_id($table, $id)
{
    $random_str = rand_str();

    $get_id     = get_ids($table, $id, $random_str);

    while ($get_id == true) {
        $random_str = rand_str();
        $get_id     = get_ids($table, $id, $random_str);
    }
    return $random_str;
}

function post_cart($arr)
{

    $successredirect = $_GET['from_cart'] . "&cartsuc";

    foreach ($_POST as $key => $value) {
        $arr[$key] = security($key);
    }

    $device = $arr['device'] =  $_COOKIE['device'];
    $id = $arr['product_id'];
    $arr['cart_id'] = create_id('cart', 'cart_id');

    if (isset($_SESSION['id'])) {
        $user = $arr['user_id'] = $_SESSION['id'];
        $sql = "select * from cart where product_id = '$id' and user_id = '$user' and status = 'active'";
    } else {
        $sql = "select * from cart where product_id = '$id' and device = '$device' and status = 'active'";
    }

    $row = select_rows($sql);

    if (!empty($row)) {
        $sql = "delete from cart where product_id = '$id' and (user_id = '$user' or device = '$device') and status = 'active'";
        insert_delete_edit($sql);
    }

    build_sql_insert("cart", $arr);
    if (isset($_GET['from_cart'])) {
        header("Location: " . $successredirect);
        exit();
    } else {
        header("location:../cart?suc");
    }
}

function post_inquiry($arr)
{
    foreach ($_POST as $key => $value) {
        $arr[$key] = security($key);
    }



    $subject        = 'New Inquiry On Bepari Website';
    $name           = 'Bepari Website';
    $body           = '<p style="font-family:Poppins, sans-serif;">';
    $body           .= 'Hello Admin. You have a new message from the website.<br>';
    $body           .= '<b>NAME: </b> ' . $arr['name'] . ' <br>';
    $body           .= '<b>EMAIL: </b> ' . $arr['email'] . ' <br>';
    $body           .= '<b>PHONE NUMBER: </b> ' . $arr['phone'] . ' <br>';
    $body           .= '<b>MESSAGE: </b> ' . $arr['message'] . ' <br>';

    $body           .= '</p>';

    if (!build_sql_insert('inquiry', $arr)) {
        header('Location:../contact.php?error');
    } else {
        email('support@beparifiduciaries.com', $subject, $name, $body);
        header('Location:../contact.php?msg');
    }
}

function post_inquiry2($arr)
{
    foreach ($_POST as $key => $value) {
        $arr[$key] = security($key);
    }



    $subject        = 'New Inquiry On Bepari Website';
    $name           = 'Bepari Website';
    $body           = '<p style="font-family:Poppins, sans-serif;">';
    $body           .= 'Hello Admin. You have a new message from the website.<br>';
    $body           .= '<b>NAME: </b> ' . $arr['name'] . ' <br>';
    $body           .= '<b>EMAIL: </b> ' . $arr['email'] . ' <br>';
    $body           .= '<b>PHONE NUMBER: </b> ' . $arr['phone'] . ' <br>';
    $body           .= '<b>MESSAGE: </b> ' . $arr['message'] . ' <br>';

    $body           .= '</p>';

    if (!build_sql_insert('inquiry', $arr)) {
        header('Location:../index.php?error');
    } else {
        email('support@beparifiduciaries.com', $subject, $name, $body);
        header('Location:../index.php?msg');
    }
}

function post_inquiry3($arr)
{
    foreach ($_POST as $key => $value) {
        $arr[$key] = security($key);
    }

    $subject        = 'Newsletter On Bepari Website';
    $name           = 'Bepari Website';
    $body           = '<p style="font-family:Poppins, sans-serif;">';
    $body           .= 'Hello Admin. You have a new newsletter subscription from the website.<br>';
    $body           .= '<b>EMAIL: </b> ' . $arr['email'] . ' <br>';

    $body           .= '</p>';

if (verify($arr['g-recaptcha-response'])) {
   
        email('support@beparifiduciaries.com', $subject, $name, $body);
}
        header('Location:..'.$_GET['from'].'?success');
}

function verify($response) {
    $curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.google.com/recaptcha/api/siteverify',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS => array('secret' => '6LePb0MlAAAAANPtaMLNRSixTEsZ7O9ilbfRDQSb','response' => $response),
));

$response = curl_exec($curl);

curl_close($curl);
return json_decode($response)->success;
}
function create_user($arr)
{

    foreach ($_POST as $key => $value) {
        if ($key == 'phone_number') {
            if (!empty(check_error('phone_number', security($key)))) {
                header("location:../register?phone_number");
                exit();
            }
        }

        if ($key == 'email') {
            if (!empty(check_error('email', security($key)))) {
                header("location:../register?email");
                exit();
            }
        }

        if ($key == 'confirm_password') {
            unset($arr['confirm_password']);
        } elseif ($key == 'password') {
            $arr['password'] =  md5(security($key));
        } else {
            $arr[$key] = security($key);
        }
    }


    $arr['id']    = create_id('user', 'id');

    if (!build_sql_insert('user', $arr)) {
        header('Location:../register?error');
        exit();
    }

    $name = "Bepari Website";
    $htmlContent = file_get_contents("../email/new/skycamp.php");
    $subject = "Bepari Website Sign Up";


    $body .= '<p style="font-family:Montserrat, sans-serif; ">Success. Your account was created successfully.</p>';
    $body .= $htmlContent;


    // $body .= '</br><p> Thank you for your business. </br> Hyghlyte V.I. Management Team.</p>';

    email($arr['email'], $subject, $name, $body);

    $_SESSION['id']         = $arr['id'];
    $_SESSION['email']      = $arr['email'];
    $_SESSION['phone']      = $arr['phone_number'];
    $_SESSION['login']      = true;


    if (isset($_SESSION['from'])) {
        $header = path_url . ($_SESSION['from'] ?? ''); //nullable
        header('Location:' . $header);
    } else {
        header("location:https://veseninternal.co.ke/skycampkenya/index");
    }
}

function post_password_reset($arr)
{
    $selector   = $arr['pwdResetSelector'] = bin2hex(random_bytes(8));
    $token      = random_bytes(32);

    $arr['pwdResetEmail']   = $email = security('email');
    $arr['pwdResetExpires'] = date("U") + 600;

    $url = base_url . "change-password?selector=" . $selector . "&validator=" . bin2hex($token);
    $failed_redirect = base_url . "forgot-password?reset=failed";

    if (empty(get_user_by_attribute('email', $email))) {
        header("Location:" . base_url . "forgot-password?reset=fail");
        exit();
    }

    if (!insert_delete_edit("delete from pwd_reset where pwdResetEmail = '$email'")) {
        header("Location: " . $failed_redirect);
        exit();
    }

    $arr['passwordResetId'] = create_id('pwd_reset', 'passwordResetId');
    $arr['pwdResetToken']   = password_hash($token, PASSWORD_DEFAULT);

    if (!build_sql_insert('pwd_reset', $arr)) {
        header("Location: " . $failed_redirect);
        exit();
    }

    $subject = "Hyghlyte V.I. reset password link";

    $reset = 'Reset Password';

    $message = '<p> We received a password reset request from your account. Use the link below to reset your password. 
                You can ignore this email if you did not make the request</p>';
    $message .= '<p>Click <a href="' . $url . '">Hyghlyte V.I. website</a> to reset your password.</p>';
    $message .= '</br><p> Thank you for your business. </br> Hyghlyte V.I. Management Team.</p>';

    $outcome = email($email, $subject, $reset, $message, true);

    if ($outcome == 'failed') {
        header("Location: " . $failed_redirect);
        exit();
    }

    header("Location:" . base_url . "forgot-password?reset=success");
}

function delete_file($image, $table, $type = 'img')
{
    $path = ROOT_PATH . "/assets/product_images/";

    if ($type == 'vid') {
        $path = ROOT_PATH . "/assets/product_videos/";
    }

    $id = $_SESSION['edit'];
    $sql = "select $image from $table where id = '$id'";
    $row = select_rows($sql)[0];

    return unlink($path . $row[$image]);
}
