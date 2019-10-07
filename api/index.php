<?php

use api\Controller\RouteController;

use api\Model\Abilitie;
use api\Model\Evolve;
use api\Model\Fastmove;
use api\Model\Generation;
use api\Model\Mainmove;
use api\Model\Pokeball;
use api\Model\Pokemon;
use api\Model\PokemonTiny;
use api\Model\Team;
use api\Model\Type;
use api\Model\Version;

/*
 * Load needed classes
 */
require 'Controller/RouteController.php';

require 'Model/Abilitie.php';
require 'Model/Evolve.php';
require 'Model/Fastmove.php';
require 'Model/Generation.php';
require 'Model/Mainmove.php';
require 'Model/Pokeball.php';
require 'Model/Pokemon.php';
require 'Model/PokemonTiny.php';
require 'Model/Team.php';
require 'Model/Type.php';
require 'Model/Version.php';

$route = new RouteController();

/*
 * swagger
 */
$route->add('/', function () {
    header("Location: swagger/");
    exit();
});

/*
 * Abilitie
 */
$route->add('abilitie/all', function () {
    $request = new Abilitie();
    $request->abilitieAll();
});

$route->add('abilitie/max', function () {
    $request = new Abilitie();
    $request->abilitieMax();
});

$route->add('abilitie/name/.+/.+', function($intl, $name) {
    $request = new Abilitie();
    $request->abilitieName($intl, $name);
});

$route->add('abilitie/id/.+', function($number) {
    $request = new Abilitie();
    $request->abilitieId($number);
});

/*
 * Evolve
 */
$route->add('evolve/all', function () {
    $request = new Evolve();
    $request->evolveAll();
});

$route->add('evolve/max', function () {
    $request = new Evolve();
    $request->evolveMax();
});

$route->add('evolve/id/.+', function ($number) {
    $request = new Evolve();
    $request->evolveId($number);
});

/*
 * fastmove
 */
$route->add('fastmove/all', function () {
    $request = new Fastmove();
    $request->fastMoveAll();
});

$route->add('fastmove/max', function() {
    $request = new Fastmove();
    $request->fastMoveMax();
});

$route->add('fastmove/id/.+', function ($number) {
    $request = new Fastmove();
    $request->fastMoveId($number);
});

$route->add('fastmove/name/.+/.+', function ($intl, $name) {
    $request = new Fastmove();
    $request->fastMoveName($intl, $name);
});

$route->add('fastmove/type/.+', function ($name) {
    $request = new Fastmove();
    $request->fastMoveType($name);
});

/*
 * generation
 */
$route->add('generation/all', function () {
    $request = new Generation();
    $request->generationAll();
});

$route->add('generation/max', function() {
    $request = new Generation();
    $request->generationMax();
});

$route->add('generation/id/.+', function($number) {
    $request = new Generation();
    $request->generationId($number);
});

$route->add('generation/name/.+', function($name) {
    $request = new Generation();
    $request->generationName($name);
});

/*
 * mainmove
 */
$route->add('mainmove/all', function () {
    $request = new Mainmove();
    $request->mainMoveAll();
});

$route->add('mainmove/max', function() {
    $request = new Mainmove();
    $request->mainMoveMax();
});

$route->add('mainmove/id/.+', function($number) {
    $request = new Mainmove();
    $request->mainMoveId($number);
});

$route->add('mainmove/name/.+/.+', function($intl, $name) {
    $request = new Mainmove();
    $request->mainMoveName($intl, $name);
});

$route->add('mainmove/type/.+', function($name) {
    $request = new Mainmove();
    $request->mainMoveType($name);
});

/*
 * pokeball
 */
$route->add('pokeball/all', function () {
    $request = new Pokeball();
    $request->pokeballAll();
});

$route->add('pokeball/max', function () {
    $request = new Pokeball();
    $request->pokeballMax();
});

$route->add('pokeball/id/.+', function ($number) {
    $request = new Pokeball();
    $request->pokeballId($number);
});

$route->add('pokeball/generation/.+', function ($number) {
    $request = new Pokeball();
    $request->pokeballGen($number);
});

$route->add('pokeball/name/.+', function ($number) {
    $request = new Pokeball();
    $request->pokeballName($number);
});

/*
 * pokemon max
 */
$route->add('pokemon/max', function () {
    $request = new Pokemon();
    $request->pokemonMax();
});

/*
 * pokemon-full
 */
$route->add('pokemon/full/all', function () {
    $request = new Pokemon();
    $request->pokemonAll();
});

$route->add('pokemon/full/id/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonId($number);
});

$route->add('pokemon/full/generation/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonGen($number);
});

$route->add('pokemon/full/order/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonOrder($number);
});

$route->add('pokemon/full/name/.+/.+', function ($intl, $name) {
    $request = new Pokemon();
    $request->pokemonName($intl, $name);
});

$route->add('pokemon/full/type/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonType($number);
});

/*
 * pokemon-tiny
 */
$route->add('pokemon/tiny/all', function () {
    $request = new PokemonTiny();
    $request->pokemonAll();
});

$route->add('pokemon/tiny/id/.+', function ($number) {
    $request = new PokemonTiny();
    $request->pokemonId($number);
});

$route->add('pokemon/tiny/generation/.+', function ($number) {
    $request = new PokemonTiny();
    $request->pokemonGen($number);
});

$route->add('pokemon/tiny/order/.+', function ($number) {
    $request = new PokemonTiny();
    $request->pokemonOrder($number);
});

$route->add('pokemon/tiny/name/.+/.+', function ($intl, $name) {
    $request = new PokemonTiny();
    $request->pokemonName($intl, $name);
});

$route->add('pokemon/tiny/type/.+', function ($number) {
    $request = new PokemonTiny();
    $request->pokemonType($number);
});

/*
 * team
 */
$route->add('team/all', function() {
    $request = new Team();
    $request->teamAll();
});

$route->add('team/max', function() {
    $request = new Team();
    $request->teamMax();
});

$route->add('team/name/.+/.+', function ($intl, $name) {
    $request = new Team();
    $request->teamName($intl, $name);
});

$route->add('team/id/.+', function($name) {
    $request = new Team();
    $request->teamId($name);
});

/*
 * type
 */
$route->add('type/all', function () {
    $request = new Type();
    $request->typeAll();
});

$route->add('type/max', function () {
    $request = new Type();
    $request->typeMax();
});

$route->add('type/id/.+', function ($number) {
    $request = new Type();
    $request->typeId($number);
});

$route->add('type/name/.+/.+', function ($intl, $name) {
    $request = new Type();
    $request->typeName($intl,$name);
});

/*
 * version
 */
$route->add('version', function () {
    $request = new Version();
    $request->version();
});

$route->run();
