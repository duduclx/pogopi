<?php

// if needed, change values

$host       = "localhost"; // enter your hostname
$dbname     = "pogopiV2"; // you can change the database name, then change it in init.sql too !
$username   = "root"; // put correct user name
$password   = "cochon"; // put correct password

$url = 'http://localhost/pogopi/api/'; // put correct url
$urlResources = $url . 'resources/';

$urlTypeImg = $urlResources . 'types/flat/';
$urlPokemonAttack = $urlResources . 'pokemons/attacks/';
$urlPokemonImg = $urlResources . 'pokemons/png/';
$urlPokemonScream = $urlResources . 'pokemons/scream/';

$urlPokeballImg = $urlResources . 'pokeballs/';

$urlTeamImg = $urlResources . 'teams/';


$dsn        = "mysql:host=$host;dbname=$dbname"; // please delete me after install
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);
