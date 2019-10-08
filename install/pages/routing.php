<?php
// default route
if (!isset($_GET['page'])) {
    $title = 'installation - database';
    $page = 'init.php';
}
// parametered route
if (isset($_GET['page'])) {
    if ($_GET['page'] === 'populated') {
        $title = 'installation - données';
        $page = 'populate.php';
    } elseif ($_GET['page'] === 'installed') {
        $title = 'installation finie';
        $page = 'installed.php';
    } elseif ($_GET['page'] === 'documentation') {
        $title = 'installation - documentation';
        $page = 'documentation.php';
    }
}
