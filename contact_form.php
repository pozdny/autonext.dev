<?php
/**
 * Created by PhpStorm.
 * User: Valentina
 * Date: 17.07.2015
 * Time: 10:18
 */
$to = 'avtonext.vv@ngs.ru'.', '; // Укажите е-mail, на который вы желаете получать заказы
$to.= 'parts-avtonext@list.ru';

$site_name   = 'avtonext-nsk.ru';
$site_email  = 'avtonext.vv@ngs.ru';
if(isset($_POST['str']) && $_POST['str'] == 'zapchasti'){
    if(isset($_POST['arr'])){
        $arr = $_POST['arr'];
    }
    foreach($arr as $key=>$val){
        if($val['name'] == 'marka')   $marka   = $val['value'];
        if($val['name'] == 'kuzov')   $kuzov = $val['value'];
        if($val['name'] == 'zip')     $zip   = $val['value'];
        if($val['name'] == 'name')    $name    = $val['value'];
        if($val['name'] == 'telefon') $telefon = $val['value'];
        if($val['name'] == 'email')   $email  = $val['value'];
    }
    $subject = "=?utf-8?B?" . base64_encode("Запрос с сайта ".$site_name." со страницы запчасти") . "?=";
    $message = "<html>
<head>
        <title>Посетитесь Вашего сайта отправил следующие данные:</title>
</head>
<body>
    <table>
   <tr><td>Марка авто:</td><td>".$marka."</td></tr>
    <tr><td>Номер кузова:</td><td>".$kuzov."</td></tr>
    <tr><td>Перечень запчастей:</td><td>".$zip."</td></tr>
   <tr><td>Имя:</td><td>".$name."</td></tr>
    <tr><td>Телефон:</td><td>".$telefon."</td></tr>
   <tr><td>E-mail:</td><td>".$email."</td></tr>
   </table>
</body>
</html>";
}
if(isset($_POST['str']) && $_POST['str'] == 'equimpent'){
    if(isset($_POST['arr'])){
        $arr = $_POST['arr'];
    }
    foreach($arr as $key=>$val){
        if($val['name'] == 'zip')     $zip   = $val['value'];
        if($val['name'] == 'name')    $name    = $val['value'];
        if($val['name'] == 'telefon') $telefon = $val['value'];
        if($val['name'] == 'email')   $email  = $val['value'];
    }
    $subject = "=?utf-8?B?" . base64_encode("Запрос с сайта ".$site_name." со страницы оборудование") . "?=";
    $message = "<html>
<head>
        <title>Посетитесь Вашего сайта отправил следующие данные:</title>
</head>
<body>
    <table>
    <tr><td>Перечень оборудования:</td><td>".$zip."</td></tr>
   <tr><td>Имя:</td><td>".$name."</td></tr>
    <tr><td>Телефон:</td><td>".$telefon."</td></tr>
   <tr><td>E-mail:</td><td>".$email."</td></tr>
   </table>
</body>
</html>";
}
$send = true;

if ($send) {
    $header   = "From: \"{$site_name}\" <{$site_email}>\n";
    $header.= "Content-type: text/html; charset=\"utf-8\"";
    mail($to, $subject, $message, $header);
    echo 'ok';
//    header('Location: /');
}
