<?php
function place_coord($name){
$name = explode(" ",$name);
$name = implode("%20",$name);
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=geometry&input=".$name."&inputtype=textquery&key=AIzaSyAMEJEBjQvanm97dkqbCh-_NxQt6DAlR38",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
));

$response = curl_exec($curl);

curl_close($curl);
//echo $response;
$r = json_decode($response);
$h = array("lat"=>$r->candidates[0]->geometry->location->lat,"long"=>$r->candidates[0]->geometry->location->lng);
return $h;
}

function distance_mat($originlat,$originlng,$detlat,$detlng){
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=".$detlat.",".$detlng."&origins=".$originlat.",".$originlng."&key=AIzaSyB_RGLBlaaz2qCjLmg-irCchjdhU0MqtUM",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
));

$response = curl_exec($curl);

curl_close($curl);
$r = json_decode($response);
return $r->rows[0]->elements[0]->distance->text;
}