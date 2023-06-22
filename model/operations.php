<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include_once 'email.php';


date_default_timezone_set('Africa/Nairobi');
$date = date('Y-m-d H:i:s');

function connect()
{
   return mysqli_connect("localhost", "beparifiduciarie_bepari", "6wVCtmoa2CoIB&5^", "beparifiduciarie_bepari");
}

function security($name)
{
    $conn = connect();
    $value = trim($_POST[$name]);

    if ($name == 'email') {
        $email = filter_var($value, FILTER_SANITIZE_EMAIL);
        $value = filter_var($email, FILTER_VALIDATE_EMAIL);
    }

    $value = escape($value);

    return mysqli_real_escape_string($conn, $value);
}

function escape($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

function select_rows($sql)
{
    $conn = connect();
    $res = mysqli_query($conn, $sql);
    $result = array();
    while ($row = $res->fetch_assoc()) {
        $result[] = $row;
    }
    return $result;
}

function insert_delete_edit($sql)
{
    $conn = connect();
    if (mysqli_query($conn, $sql)) {
        return true;
    } else {
        echo mysqli_error($conn);
    }
}

function sql_counter($sql){
    $conn = connect();
    return mysqli_num_rows(mysqli_query($conn, $sql));
}

function delete($table, $id, $col='id')
{
    $conn = connect();
    $sql = "delete from `$table` where $col = '$id'";
    if (insert_delete_edit($sql)) {
        return true;
    } else {
        return false;
    }
}

function delete_from_cart($table, $id, $col='id')
{
    $conn = connect();
    $sql = "delete from `$table` where $col = '$id'";
    if (insert_delete_edit($sql)) {
        return true;
    } else {
        return false;
    }
}

function build_sql_insert($table, $elements)
{
    $sql = "insert into `$table` ( ";
    $i = sizeof($elements);
    $j = 0;
    foreach ($elements as $key => $value) {
        $j++;
        if ($i != $j) {
            $sql .= "`$key`" . ",";
        } else {
            $sql .=  "`$key`";
        }
    }
    $j = 0;
    $sql .= ") values (";
    foreach ($elements as $value) {
        $j++;
        if ($i != $j) {
            $sql .= "'$value'" . ",";
        } else {
            $sql .= "'$value'";
        }
    }
    $sql .= ")";
    
   
    return insert_delete_edit($sql);
}

function build_sql_edit($table, $elements, $id, $col = "id")
{
    $sql = "update `$table` set ";
    $i = sizeof($elements);
    $j = 0;
    foreach ($elements as $key => $value) {
        $j++;
        if ($i != $j) {
            $sql .= "`$key`" . " = " . "'$value',";
        } else {
            $sql .=  "`$key`" . " = " . "'$value'";
        }
    }

    $sql .= "where `$col` = '$id'";
    return insert_delete_edit($sql);
}
function build_multiple_sql_edit($table, $elements, $id, $ids, $col = "id", $cols)
{
    $sql = "update `$table` set ";
    $i = sizeof($elements);
    $j = 0;
    foreach ($elements as $key => $value) {
        $j++;
        if ($i != $j) {
            $sql .= "`$key`" . " = " . "'$value',";
        } else {
            $sql .=  "`$key`" . " = " . "'$value'";
        }
    }

    $sql .= "where `$col` = '$id' and `$cols` = '$ids'";
    return insert_delete_edit($sql);
}

function input($label, $name, $row = array(), $required = false, $type = "text", $readonly = false)
{
?>
<div class="form-group">
    <label><?php echo $label ?></label>
    <input type="<?php echo $type ?>" required class="form-control" <?php echo $required ? 'required' : '' ?>
        value='<?= !empty($row) ? $row[$name] : '' ?>' name="<?php echo $name ?>"
        <?= $readonly == true ? 'readonly="readonly" ' : '' ?>>
</div>
<?php
}

function input_hybrid($label, $name, $row = array(), $required = true, $type = "text", $input_id = '', $class = '', $extra = '', $readonly = false,$placehoolder='')
{
    $form_id = $input_id != '' ? $input_id : $name;
?>
<div class="form-group <?= $class ?>">
    <label for="<?= $form_id ?>"><?= $label ?></label>
    <input type="<?= $type ?>" <?= $required ? 'required' : '' ?>
        <?= isset($extra) ? ($extra == 'img' ? 'accept=".png, .jpg, .jpeg"' : (($extra == 'vid') ? 'accept=".mp4, .mkv, .m4v"' : (($extra == 'doc') ? 'accept=".pdf, .docx"' : (($extra == 'lib') ? 'accept=".pdf"' : '')))) : ''; ?>
        id="<?= $form_id ?>" value='<?= !empty($row) ? $row[$name] : '' ?>' class="form-control" name="<?= $name ?>" placeholder="<?= $placehoolder ?>"
        <?= $type == 'password' ? "minlength='6'" : '' ?> autocomplete="on"
        <?= $readonly == true ? 'readonly="readonly" ' : '' ?>>
</div>
<?php
}





function input_select($text, $name, $row = array(), $required = true, $array, $class = '', $label = true, $r=false, $placeholder='')
{ ?>
<div class="form-group <?= $class ?>">
    <?php
    if($label == true){  ?>
         <label for="<?= $name ?>"><?= ucfirst($text) ?> : <?= !empty($row) ? ucfirst($row[$name]) : '' ?> </label>
    <?php }
    ?>
    <Select id="<?= $name ?>" <?= $required ? 'required' : '' ?> class="form-control <?= $class ?>" placeholder="<?= $placeholder ?>" name="<?= $name ?>">
        <?= empty($row) || $row[$name] === null ? '<option hidden value="" selected disabled>' . $text . '</option>' : '' ?>
        <?php foreach ($array as $value) {
                $selected = false;
                if (!empty($row) && ($row[$name] === $value)) {
                    $selected = true;
                } 
                
                if($r == true ){ ?>
                    <option <?= $selected ? 'selected disabled' : '' ?> value="<?= $value[$name] ?>"><?= ucwords($value[$name]) ?></option>
                <?php } else{ ?>
                     <option <?= $selected ? 'selected disabled' : '' ?> value="<?= $value ?>"><?= ucwords($value) ?></option>
               <?php }
         } ?>
    </Select>
</div>
<?php
}


function input_select_bs($text, $name, $row = array(), $required = true, $array, $class = '',$placeholder=''){
     ?>
     <div class="form-group">
<!--<label for="<?= $name ?>"> </label>-->
    <Select id="<?= $name ?>" <?= $required ? 'required' : '' ?> class="form-control <?= $class ?>" placeholder="<?= $placeholder ?>" name="<?= $name ?>">
        <?= empty($row) || $row[$name] === null ? '<option value="" selected disabled>' . $text . '</option>' : '' ?>
        <?php foreach ($array as $value) {
                $selected = false;
                if (!empty($row) && ($row[$name] === $value)) {
                    $selected = true;
                } ?>
        <option <?= $selected ? 'selected disabled' : '' ?> value="<?= $value ?>"><?= ucwords($value) ?></option>
        <?php } ?>
    </Select>
</div>
<?php
}

function input_array($label, $name, $type = "text")
{
?>
<div class="form-group">
    <label><?php echo $label ?></label>
    <input type="<?php echo $type ?>" class="form-control" name="<?php echo $name ?>[]">
</div>
<?php
}
function textarea_input($label, $name, $row = array(), $required = true)
{ ?>
<div class="form-group">
    <label><?php echo $label ?></label>
    <textarea class="form-control" style="min-width: 100%; max-width: 100%;" name="<?php echo $name ?>"
        id="<?php echo $name ?>" rows="5" <?php echo $required ? 'required' : '' ?>>
        <?php echo !empty($row) ? $row[$name] : '' ?>
    </textarea>
</div>
<?php
}
function submit($submit = "submit", $btn_color = 'warning', $position = "text-left", $class = "")
{
?>
<div class="<?php echo $position ?>">
    <button id="add" onclick="return valid();"
        class="btn btn-<?= $btn_color ?> <?php echo $class ?>"><?php echo $submit ?></button>
</div>
<?php
}

function rand_str($id_length  = 11, $embed_str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
{
    $str        = '1234567890abcdefghijklmnopqrstuvwxyz' . $embed_str;
    return substr(str_shuffle($str), 0, $id_length);
}

function upload($name2, $type = 'img')
{
    if (isset($_FILES[$name2]["name"]) && $_FILES[$name2]["name"] != '') {

        $target_dir = ROOT_PATH . "/uploads/";

        if ($type == 'lib') {
            $target_dir = DIR_PATH . "/uploads/";
        }

        $rand           =  rand_str(4, '');
        $rands          =  rand_str(4, '');

        $name = basename($_FILES[$name2]["name"]);
        $tmpname = $_FILES[$name2]["tmp_name"];
        $extention = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        $filename = ($type != 'img' ? 'doc' : 'img') . $rand . date("yhjHidYsma") . $rands;
        $image_path = $target_dir . $filename . "." . $extention;

        $check = $type != 'img' ? check_ext_doc($extention) : check_ext($extention);

        if (!$check) {
            return false;
        }

        //compress only images greater than 1mb
        if ($type == 'imgsize') {
            return compressImage($tmpname, $image_path, $filename, $extention);
        }

        move_uploaded_file($tmpname, $image_path);
        return $filename . "." . $extention;
    } else {
        return false;
    }
}

function check_ext($ext)
{
    if ($ext == "png" || $ext == "jpg" || $ext == "jpeg") {
        return true;
    } else {
        return false;
    }
}

function check_ext_vid($ext)
{
    if ($ext == "mkv" || $ext == "m4v" || $ext == "mp4") {
        return true;
    } else {
        return false;
    }
}

function check_ext_doc($ext)
{
    if ($ext == "pdf" || $ext == "docx") {
        return true;
    } else {
        return false;
    }
}

function message($color, $content, $my_message)
{ ?>
<div class="alert alert-<?= $color ?> alert-dismissible text-center">
    <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong><?= $content ?>!</strong> <?= $my_message ?>
</div>
<?php }

function limit_text($content, $limit  = 10)
{
    $text   = $content;
    if (str_word_count($text, 0) > $limit) {
        $words = str_word_count($text, 2);
        $pos   = array_keys($words);
        $text  = substr($text, 0, $pos[$limit]) . '...';
    }
    return $text;
}

function limit_texts($content, $limit  = 30)
{
    $text   = $content;
    if (str_word_count($text, 0) > $limit) {
        $words = str_word_count($text, 2);
        $pos   = array_keys($words);
        $text  = substr($text, 0, $pos[$limit]) . '...';
    }
    return $text;
}

function days_calculator($first_date, $other_date = "today")
{
    $timezone   = new DateTimeZone('Africa/Nairobi');
    $date1      = new DateTime($first_date, $timezone);
    $date2      = new DateTime($other_date, $timezone);
    $date       = $date1->diff($date2);
    return $date->format('%R%a days') + 0;
}

function time_difference($time1, $time2){
    
    $time1 = strtotime($time1);
    $time2 = strtotime($time2);

    $timediff = abs($time2 - $time1);

    if(floor($timediff) < 60){
        return floor($timediff) .' sec';
    }elseif(floor($timediff/(60)) < 60){
        return floor($timediff/(60)) . ' min(s)';
    }elseif(floor($timediff/(60*60)) < 24){
        return floor($timediff/(60*60)) . ' hr(s)';
    }elseif(floor($timediff/(60*60*24)) < 30){
        return floor($timediff/(60*60*24)) . ' day(s)';
    }elseif(floor($timediff/(60*60*24*30) < 12)){
        return floor($timediff/(60*60*24*30)) . ' month(s)';
    }else{
        return floor($timediff/(60*60*24*30*365)) . ' year(s)';
    }
}

function success_message($msg)
{
    message('success', 'Success', $msg);
}

function error_message($msg)
{
    message('danger', 'Failed', $msg);
}

function warning_message($msg, $warning = 'Warning')
{
    message('warning', $warning, $msg);
}

function strip_id_string($string)
{
    $s = explode(" ", $string);
    return $s[1];
}


function compressImage($source, $destination, $filename, $extention)
{
    $imgInfo = getimagesize($source);
    $dataMine = $imgInfo['mime'];

    switch ($dataMine) {
        case 'image/jpeg':
            $image = imagecreatefromjpeg($source);
            break;
        case 'image/png':
            $image = imagecreatefrompng($source);
            break;
        case 'image/jpg':
            $image = imagecreatefromgif($source);
            break;
        default:
            $image = imagecreatefromjpeg($source);
    }

    imagejpeg($image, $destination);

    // final Return compressed image 
    return $filename . "." . $extention;
}

function encryptString($string, $action, $encryptedIP = '')
{
    global $flag;

    $output = false;
    $extraKey = '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';

    $encrypt_method = "AES-256-CBC";
    $secret_key = $flag['2nd-encrypt-key'] . $encryptedIP . '-' . $extraKey;
    $secret_iv = $flag['2nd-encrypt-secret'] . $encryptedIP . '-' . $extraKey;

    $key = hash('sha256', $secret_key);
    $iv = substr(hash('sha256', $secret_iv), 0, 16);

    $output;

    if ($action == 'encrypt') {
        $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
        $output = base64_encode($output);
        //replace equal signs with char that hopefully won't show up
        $output = str_replace('=', '[equal]', $output);
    } else if ($action == 'decrypt') {
        //put back equal signs where your custom var is
        $setString = str_replace('[equal]', '=', $string);
        $output = openssl_decrypt(base64_decode($setString), $encrypt_method, $key, 0, $iv);
    }

    return $output;
}

function crypt_id($string, $get_ip = '', $action = 'encrypt')
{
    return encryptString($string, $action, $get_ip);
}

$get_ip = encryptString(get_ip(), 'encrypt');

function encrypt($id)
{
    global $get_ip;
    return crypt_id($id, $get_ip);
}

function decrypt($encrypt_id)
{
    global $get_ip;
    return crypt_id($encrypt_id, $get_ip, 'decrypt');
}


function get_ip()
{
    // if (isset($_SERVER['HTTP_CLIENT_IP'])) {
    //     return $_SERVER['HTTP_CLIENT_IP'];
    // } elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    //     return $_SERVER['HTTP_X_FORWARDED_FOR'];
    // } else {
    //     return $_SERVER['REMOTE_ADDR'];
    // }
    return 1;
}

function logout()
{
    session_start();

    $_SESSION = array();
    unset($_SESSION);

    session_unset();
    session_destroy();
    session_write_close();
    setcookie(session_name(), '', 0, '/');
    session_regenerate_id(true);
    header("location:../index");
}

function cout($arr, $type = 'p'){
    echo '<pre>';
    $type == 'p' ? print_r($arr) : var_dump($arr);
    echo '</pre>';
}
