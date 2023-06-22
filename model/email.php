<?php
use PHPMailer\PHPMailer\PHPMailer;

require 'PHPMailer/vendor/phpmailer/phpmailer/src/Exception.php';
require 'PHPMailer/vendor/phpmailer/phpmailer/src/PHPMailer.php';
require 'PHPMailer/vendor/phpmailer/phpmailer/src/SMTP.php';
require 'PHPMailer/vendor/autoload.php';

function email($email, $subject, $header, $message, $bcc = true)
{
    $sender = 'system@beparifiduciaries.com';

    $mail = new PHPMailer();
    $mail->isSMTP();
    $mail->Host = 'mail.beparifiduciaries.com';
    $mail->SMTPAuth     = TRUE;
    $mail->SMTPSecure   = 'ssl';
    $mail->Port         = 465;
    $mail->isHTML(true);
    $mail->Username     = $sender;
    $mail->Password     = '6wVCtmoa2CoIB&5^';
    
    $mail->addBcc('sales@beparifiduciaries.com');
    
    $mail->Subject = $subject;
    $mail->SetFrom($sender, $header);
    $mail->Body = $message;
    $mail->AddAddress($email);
    // $mail->addBcc('info@mawingucampkenya.com');
    if (!$mail->Send()) {
        return "failed";
    } else {
        return "success";
    }

    $mail->smtpClose();
}