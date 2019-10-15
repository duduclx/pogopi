<?php
/*
 * logic
 */

// import config's url ($url)
require 'api/controller/config.php';

// get types
$get_data = callAPI('GET', $url . 'type/all', false);
$types = json_decode($get_data, true);

// get pokedex
$get_data = callAPI('GET', $url . 'generation/all', false);
$pokedexes = json_decode($get_data, true);

// get pokemons
$get_data = callAPI('GET', $url . 'pokemon/tiny/all/order', false);
$pokemons = json_decode($get_data, true);

/*
 * templates
 */
if (isset($_GET['type'])) {
    $get_data = callAPI('GET', $url . 'pokemon/tiny/type/' . $_GET['type'], false);
    $pokemons = json_decode($get_data, true);
}

if (isset($_GET['pokedex'])) {
    $get_data = callAPI('GET', $url . 'pokemon/tiny/generation/' . $_GET['pokedex'], false);
    $pokemons = json_decode($get_data, true);
}

if (isset($_GET['pokemon'])) {
    $get_data = callAPI('GET', $url . 'pokemon/full/id/' . $_GET['pokemon'], false);
    $pokemon = json_decode($get_data, true);
}
include 'www/templates/pokemon.html';


