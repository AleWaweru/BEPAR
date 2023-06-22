<?php
include_once '../path.php';
include_once 'read.php';
    
use Dompdf\Dompdf;

$arr    = array();
$array  = array();

$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
    case 'change_password':
        update_password($arr); 
        break;
    case 'reset':
        update_reset($arr);
        break;
    case 'home_logout':
        logout();
        break;
    case 'profile':
        update_profile($arr);
        break;
    case 'verify_email':
        update_verification($arr);
        break;
    case 'payment':
        update_payment($arr);
        break;
}

function update_payment($arr){
    $header     = 'Hyghlyte V.I. Order Payment';
    $email      = $_SESSION['email'] ;
    $subject    = 'Hyghlyte V.I. Payment Confirmation';
    $message    = file_get_contents(base_url . 'invoice?id=' . $_SESSION['id'] . '&order_id=' . $_SESSION['order_id']);

    $order = get_my_orders($_SESSION['id'], $_SESSION['order_id'])[0];
    $orders_list = get_my_orders_list($_SESSION['order_id']);
    
    foreach ($orders_list as $order_list){
        $vendor_email = get_vendor_email($order_list['vendor_id'])['email'];
        $activity_name = $order_list['name'];

        $message2   = "<p> You have an order on <strong>$activity_name</strong> from $email. </p>";
        $message2   .= "<p> Login to vendor dashboard to see more details. {$vendor_email}</p>";
        $message2 .= '</br><p> Thank you for doing business with us. </br> Hyghlyte V.I. Management Team.</p>';
        $subject2   = "Order on $activity_name";
        
        email($vendor_email, $subject2, $header, $message2, true);
    }
    
    
    require_once 'all_vendors/autoload.php';
    
    $booking = '';
    $no = 1;
    
    $barcode1 = new \Com\Tecnick\Barcode\Barcode();
    $bobj1 = $barcode1->getBarcodeObj('QRCODE,H', 'the client id is :' . $order['device'],  -4, -4, 'black', array(-2, -2, -2, -2))->setBackgroundColor('#f0f0f0');
    
    $dompdf = new Dompdf();
    $dompdf->loadHtml('
    <!DOCTYPE html>
    <html lang="en" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml">
    
    <head>
        <style>
            * {
                box-sizing: border-box;
            }
    
            body {
                margin: 0;
                padding: 0;
            }
    
            th.column {
                padding: 0
            }
    
            a[x-apple-data-detectors] {
                color: inherit !important;
                text-decoration: inherit !important;
            }
    
            #MessageViewBody a {
                color: inherit;
                text-decoration: none;
            }
    
            p {
                line-height: inherit
            }
    
            @media(max-width:720px) {
                .icons-inner {
                    text-align: center;
                }
    
                .icons-inner td {
                    margin: 0 auto;
                }
    
                .row-content {
                    width: 100% !important;
                }
    
                .mobile_hide {
                    display: none;
                }
    
                .stack .column {
                    width: 100%;
                    display: block;
                }
    
                .mobile_hide {
                    min-height: 0;
                    max-height: 0;
                    max-width: 0;
                    overflow: hidden;
                    font-size: 0;
                }
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    
    <body style="background-color: #fbfbfb; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;">
        <table border="0" cellpadding="0" cellspacing="0" class="nl-container" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fbfbfb;" width="100%">
            <tbody>
                <tr>
                    <td>
                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-2" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                            <tbody>
                                <tr>
                                    <td>
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="row-content stack" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f4f4f4; color: #000000;" width="700">
                                            <tbody>
                                                <tr>
                                                    <th class="column" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;" width="100%">
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-bottom:25px;padding-left:25px;padding-right:10px;padding-top:10px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #555555; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:28px; text-align:center;">From Hyghlyte V.I.</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--qr start-->
                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-3" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                            <tbody>
                                <tr>
                                    <td>
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="row-content stack" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f4f4f4; color: #000000;" width="700">
                                            <tbody>
                                                <tr>
                                                    <th class="column" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;" width="50%">
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-bottom:10px;padding-left:25px;padding-right:10px;padding-top:50px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #232323; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:17px;">
                                                                                    ' . $bobj1->getHtmlDiv() . ' <br />
                                                                                    ' . $order['device'] . '
                                                                                </span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </th>
                                                    <th class="column" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;" width="50%">
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-bottom:10px;padding-left:25px;padding-right:10px;padding-top:50px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #232323; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:17px;">Invoice Details:</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-left:25px;padding-right:10px;padding-top:40px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #848484; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:15px;">Invoice For: ' . ucwords($order['first_name'] . " " . $order['last_name']) . '</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table><table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-left:25px;padding-right:10px;padding-top:10px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #848484; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:15px;">Invoice ID: ' . $order['order_number'] . '</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-left:25px;padding-right:10px;padding-top:10px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #848484; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:15px;">Invoice Date: ' . date('D, m/d/Y', strtotime($order['date_created'])) . '</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-left:25px;padding-right:10px;padding-top:10px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #848484; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <p style="margin: 0; font-size: 14px;">
                                                                                <span style="font-size:15px;">Payment Method: ' . $order['payment_method'] . '</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_block" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                                            <tr>
                                                                <td style="padding-left:25px;padding-right:10px;padding-top:10px;padding-bottom:5px;">
                                                                    <div style="font-family: sans-serif">
                                                                        <div style="font-size: 12px; mso-line-height-alt: 18px; color: #ff4556; line-height: 1.5; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
                                                                            <span style="font-size:15px;">Total: ' . $order['total'] . '</span>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- End -->
    </body>
    </html>
      ');
    // (Optional) Setup the paper size and orientation
    $dompdf->setPaper('A5', 'landscape');
    // Render the HTML as PDF
    $dompdf->render();
    // $dompdf->stream();
    $output = $dompdf->output();
        
    if (file_put_contents('qr_details.pdf', $output)) {
        $pat_email = 'ndungu.murimi@gmail.com';
        $hyghlyte_email = 'info@thehyghlyteco.com'; 

        send_email_file($pat_email, $subject, $header, $message, 'qr_details.pdf', true);
        send_email_file($hyghlyte_email, $subject, $header, $message, 'qr_details.pdf');
        $outcome = send_email_file($email, $subject, $header, $message, 'qr_details.pdf');
    }
    
    header("Location: " . base_url . 'my_profile#section-2?suc&' . $outcome);
}

function update_profile($arr){
    foreach ($_POST as $key => $value) {
            $arr[$key] = security($key);
    }
    
    if (!build_sql_edit('user', $arr, $_SESSION['id'])) {
        header('Location:' . base_url . 'my_profile?error');
    } 
    
    header('Location:' . base_url . 'my_profile?suc');
}

function update_reset($arr)
{
    $selector           = security("selector");
    $validator          = security("validator");
    $arr['password']    = md5(security("password"));
    $currentTimeStamp   = date("U");
    $failed_redirect    = base_url . "change-password.php?newpass=re-submit&selector=" . $selector . "&validator=" . $validator;

    $pwd_reset = get_pwd_reset($selector, $currentTimeStamp);
    
    if (empty($pwd_reset)) {
        header("Location:" . $failed_redirect);
        exit();
    }

    $tokenBinary    = hex2bin($validator);
    $tokenCheck     = password_verify($tokenBinary, $pwd_reset['pwdResetToken']);

    if ($tokenCheck === false) {
        header("Location:" . $failed_redirect);
        exit();
    }

    $tokenEmail = $pwd_reset['pwdResetEmail'];

    $user = get_user_by_attribute('email', $tokenEmail);
    
    if (empty($user)) {
        header("Location:" . $failed_redirect);
        exit();
    }

    if (!build_sql_edit('user', $arr, $tokenEmail, 'email')) {
        header("Location:" . $failed_redirect);
        exit();
    }

    if (!insert_delete_edit("delete from pwd_reset where pwdResetEmail = '$tokenEmail'")) {
        header("Location:" . $failed_redirect);
        exit();
    }
    
    header("Location:" . base_url . "login?newpass&${user[user_type]}");

}

function update_verification($arr)
{
    global $date;
    
    if (empty(get_specific_user(security('verification_code'), security('email'), 'verification_code'))) {
        header("location:" . base_url . 'email_verification?failed&user_type=' . security('user_type') . '&email=' . security('email'));
    } else {
        $arr['verified_at'] = $date;

        build_multiple_sql_edit('user', $arr, security('email'), security('verification_code'), 'email', 'verification_code');

        $profile = get_user_by_attribute('email', security('email'));

        $_SESSION['login']      = true;
        $_SESSION['id']         = $profile['id'];
        $_SESSION['email']      = $profile['email'];
        $_SESSION['idnumber']   = $profile['id_number'];
        $_SESSION['phone']      = $profile['phone_number'];
        $_SESSION['fullname']   = $profile['first_name'] . " " . $profile['last_name'];

        $arr['device'] = $device = $_COOKIE['device'];
        build_sql_edit('user', $arr, $_SESSION['id']);
        
        $sql = "select * from cart where device = '$device'";
        
        if (!empty(select_rows($sql))) {
            build_sql_edit('cart', array('user_id' => $_SESSION['id']), $device, 'device');
        }
            
        $name = "Hyghlyte V.I.";
        $subject = "$name Verification Successful";
    
        $body = '<p> Your account verification is successful</b></br></p>';
    
        $body .= '<p> You may proceed to go through the system and make your order/bookings</p>';
    
        $outcome = email($profile['email'], $subject, $name .  " verification", $body, true);

        $redirect = base_url . (isset($_SESSION['checkout']) ? "payment?logged&$outcome" : "?$outcome");
        unset($_SESSION['checkout']);
        header('Location:' . $redirect);
    }
}

function change_password($arr){
    $password           = md5(security('password'));
    $new_password       = security('new_password');
    $confirm_password   = security('confirm_password');
    
    $id = $_SESSION['id'];

    if($new_password !== $confirm_password) {
        header("location:" . vendor_url . "change_password.php?pass"); 
        exit();
    }

    $sql = "select * from user where id = '$id' and password = '$password'";
    $row = select_rows($sql);
    
    if(empty($row)) {
        header("location:" . vendor_url . "change_password.php?unsuc"); 
        exit();
    }

    $arr['password'] = md5($new_password);

    build_sql_edit("user", $arr, $id);

    header("location:" . vendor_url . "change_password.php?suc");
}
