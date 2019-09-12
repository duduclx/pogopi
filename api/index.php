<?php

use api\Controller\RouteController;

use api\Model\Abilitie;
use api\Model\Fastmove;
use api\Model\Generation;
use api\Model\Mainmove;
use api\Model\Pokeball;
use api\Model\Pokemon;
use api\Model\Team;
use api\Model\Type;
use api\Model\Version;

/*
 * Load needed classes
 */
require 'Controller/RouteController.php';

require 'Model/Abilitie.php';
require 'Model/Fastmove.php';
require 'Model/Generation.php';
require 'Model/Mainmove.php';
require 'Model/Pokeball.php';
require 'Model/Pokemon.php';
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

$route->add('.+/abilitie/.+', function($intl, $name) {
    $request = new Abilitie();
    $request->abilitieName($intl, $name);
});

$route->add('abilitie/id/.+', function($number) {
    $request = new Abilitie();
    $request->abilitieId($number);
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

$route->add('fastmove/fr/.+', function ($name) {
    $request = new Fastmove();
    $request->fastMoveFr($name);
});

$route->add('fastmove/type/.+', function ($name) {
    $request = new Fastmove();
    $request->fastMoveType($name);
});

/*
 * generation
 */
$route->add('generation/id/.+', function($number) {
    $request = new Generation();
    $request->generationId($number);
});

$route->add('generation/name/.+', function($name) {
    $request = new Generation();
    $request->generationName($name);
});

$route->add('generation/max', function() {
    $request = new Generation();
    $request->generationMax();
});

$route->add('generation/all', function () {
    $request = new Generation();
    $request->generationAll();
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

$route->add('mainmove/fr/.+', function($name) {
    $request = new Mainmove();
    $request->mainMoveFr($name);
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
 * pokemon
 */
$route->add('pokemon/type/id/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonTypeId($number);
});

$route->add('pokemon/type/fr/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonTypeName($number);
});

$route->add('pokemon/id/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonId($number);
});

$route->add('pokemon/fr/.+', function ($name) {
    $request = new Pokemon();
    $request->pokemonName($name);
});

$route->add('pokemon/generation/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonGen($number);
});

$route->add('pokemon/order/.+', function ($number) {
    $request = new Pokemon();
    $request->pokemonOrder($number);
});

$route->add('pokemon/max', function () {
    $request = new Pokemon();
    $request->pokemonMax();
});

$route->add('pokemon/all', function () {
    $request = new Pokemon();
    $request->pokemonAll();
});

/*
 * team
 */
$route->add('team/all', function() {
    $request = new Team();
    $request->teamAll();
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
$route->add('type/id/.+', function ($name) {
    $request = new Type();
    $request->typeId($name);
});

$route->add('type/all', function () {
    $request = new Type();
    $request->typeAll();
});

$route->add('type/max', function () {
    $request = new Type();
    $request->typeMax();
});



/*
 * version
 */
$route->add('version', function () {
    $request = new Version();
    $request->version();
});

$route->run();
