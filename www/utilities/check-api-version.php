<?php

function callAPI($method, $url, $data){
    $curl = curl_init();

    // OPTIONS:
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
    ));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);

    // EXECUTE:
    $result = curl_exec($curl);
    curl_close($curl);
    return $result;
}

$get_data = callAPI('GET', 'http://localhost/pogopi/api/version', false);
$response = json_decode($get_data, true);

if (!isset($response['version'])) {
    header('Location: /pogopi/install/index.php');
}
