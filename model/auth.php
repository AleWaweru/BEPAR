<?php
$p=0;
if(isset($_SERVER['HTTP_AUTHORIZATION'])){
    if($_SERVER['HTTP_AUTHORIZATION'] == "myguyyouguy"){
     $p = 1;   
    }
}
if($p != 1){
    http_response_code(401);
    echo json_encode(array("status"=>"unauthorized"));
    exit();
}
?>