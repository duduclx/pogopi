<?php

// if needed, change values

$host       = "localhost"; // enter your hostname
$dbname     = "pogopi"; // you can change the database name, then change it in init.sql too !
$username   = "pogopi"; // put correct user name
$password   = "pogopi"; // put correct password


$dsn        = "mysql:host=$host;dbname=$dbname"; // please delete me after install
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);