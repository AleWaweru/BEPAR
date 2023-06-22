<?php
include_once 'read.php';

$arr = array();
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
    case 'cart':
        delete_cart($arr);
        break;
}

function delete_cart($arr){
    if(!delete_from_cart('cart', $_GET['cart_id'], 'cart_id')){
        header("Location:../cart?delete_unsuc");
        exit();
    }
    
    if(isset($_GET['from_cart'])){
        header("Location: " . $_GET['from_cart']);
        exit();
    }
    
    header("Location:../cart?delete_suc");
   
}