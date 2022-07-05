<?php

require __DIR__.'/vendor/autoload.php';

use \App\Awesome\Economia;

$obEconomia = new Economia;

if(!isset($argv[1])){
    die('É necessário eniar pelo menos umas moeda');
} else{
    $moedaA = $argv[1];
}

if(!isset($argv[2])){
    $moedaB = 'BRL';
} else{
    $moedaB = $argv[2];
}

$dadosCotacao = $obEconomia->consultarCotacao($moedaA,$moedaB);


print_r($dadosCotacao);
//echo $dadosCotacao;