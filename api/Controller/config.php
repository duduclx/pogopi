<?php

// if needed, change values
$host       = "localhost"; // enter your database hostname
$dbname     = "pogopi"; // you can change the database name, then change it in init.sql too !
$username   = "root"; // put correct database username
$password   = "cochon"; // put correct database password

$url = 'http://192.168.1.11/pogopi/api/'; // put correct url

// do not touch following configuration
$urlResources = $url . 'resources/';

$urlTypeImg = $urlResources . 'types/flat/';
$urlPokemonAttack = $urlResources . 'pokemons/attacks/';
$urlPokemonImg = $urlResources . 'pokemons/png/';
$urlPokemonScream = $urlResources . 'pokemons/scream/';
$urlPokeballImg = $urlResources . 'pokeballs/';
$urlTeamImg = $urlResources . 'teams/';
