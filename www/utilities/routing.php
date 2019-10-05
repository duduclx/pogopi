<?php

if (!isset($_GET['page'])) {
    $title = 'Accueil';
    $page = 'home.php';
}


if (isset($_GET['page'])) {
    if ($_GET['page'] === 'pokemon') {
        $title = 'pokemon';
        $page = 'pokemon.php';
    }
}
