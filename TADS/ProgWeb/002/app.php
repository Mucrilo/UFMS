<?php
 header('Access-Control-Allow-Origin: *');

 header('Access-Control-Allow-Methods: GET, POST');
 
 header("Access-Control-Allow-Headers: X-Requested-With");

$x = $_POST['cur'];
$saida;

if(strpos($x, ' ')){

    $x = explode(" ",$x);
    $saida= (int)$x[0] + (int)$x[1];

}else if(strpos($x, '-')){

    $x = explode("-",$x);
    $saida= $x[0]-$x[1];
}else if(strpos($x, '*')){

    $x = explode("*",$x);
    $saida= $x[0]*$x[1];

}else if(strpos($x, '/')){

    $x = explode("/",$x);
    $saida= $x[0]/$x[1];

}else  if(strpos($x, '^')){

    $x = explode("^",$x);
    $saida= pow($x[0],$x[1]);

}else if(strpos($x, '!')){

    $x = explode("!",$x);
    $num = $x[0];  
    $saida = 1;  

    for ($i=$num; $i>=1; $i--){  
    $saida = $saida * $i;  
    }  

}else if(strpos($x,'√')){
    $x = explode("√",$x);
    $saida= sqrt($x[1]);
} else
$saida = '';

echo $saida;
?>