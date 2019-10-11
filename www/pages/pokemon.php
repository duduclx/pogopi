<?php
/*
 * logic
 */

// get types
$get_data = callAPI('GET', 'http://localhost/pogopi/api/type/all', false);
$types = json_decode($get_data, true);

// get pokemons
$get_data = callAPI('GET', 'http://localhost/pogopi/api/pokemon/tiny/all/order', false);
$pokemons = json_decode($get_data, true);

/*
 * templates
 */

include 'www/templates/pokemon.html';


