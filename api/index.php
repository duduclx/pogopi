<?php

use api\Model\abilitie;
use api\Model\Api;
use api\Controller\RouteController;
use api\Model\Fastmove;
use api\Model\Version;

/*
 * Load needed classes
 */
require 'Controller/RouteController.php';
require 'Model/Api.php';
require 'Model/Abilitie.php';
require 'Model/Fastmove.php';

require 'Model/Version.php';

$route = new RouteController();

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
    $request = new Api();
    $request->generationId($number);
});

$route->add('generation/fr/.+', function($name) {
    $request = new Api();
    $request->generationFr($name);
});

$route->add('generation/max', function() {
    $request = new Api();
    $request->generationMax();
});

$route->add('generation', function () {
    $request = new Api();
    $request->generationAll();
});

$route->add('mainmove/id/.+', function($number) {
    $request = new Api();
    $request->mainMoveId($number);
});

$route->add('mainmove/fr/.+', function($name) {
    $request = new Api();
    $request->mainMoveFr($name);
});

$route->add('mainmove/type/.+', function($name) {
    $request = new Api();
    $request->mainMoveType($name);
});

$route->add('mainmove/max', function() {
    $request = new Api();
    $request->mainMoveMax();
});

$route->add('mainmove', function () {
    $request = new Api();
    $request->mainMoveAll();
});

$route->add('pokeball/id/.+', function ($number) {
    $request = new Api();
    $request->pokeballId($number);
});

$route->add('pokeball/generation/.+', function ($number) {
    $request = new Api();
    $request->pokeballGen($number);
});

$route->add('pokeball/name/.+', function ($number) {
    $request = new Api();
    $request->pokeballName($number);
});

$route->add('pokeball/max', function () {
    $request = new Api();
    $request->pokeballMax();
});

$route->add('pokeball', function () {
   $request = new Api();
   $request->pokeballAll();
});

$route->add('pokemon/type/id/.+', function ($number) {
    $request = new Api();
    $request->pokemonTypeId($number);
});

$route->add('pokemon/type/fr/.+', function ($number) {
    $request = new Api();
    $request->pokemonTypeName($number);
});

$route->add('pokemon/id/.+', function ($number) {
    $request = new Api();
    $request->pokemonId($number);
});

$route->add('pokemon/fr/.+', function ($name) {
    $request = new Api();
    $request->pokemonName($name);
});

$route->add('pokemon/generation/.+', function ($number) {
    $request = new Api();
    $request->pokemonGen($number);
});

$route->add('pokemon/order/.+', function ($number) {
    $request = new Api();
    $request->pokemonOrder($number);
});

$route->add('pokemon/max', function () {
    $request = new Api();
    $request->pokemonMax();
});

$route->add('pokemon/all', function () {
    $request = new Api();
    $request->pokemonAll();
});

// TODO check following methods
$route->add('team/.+', function($name) {
    $request = new Api();
    $request->team($name);
});

$route->add('team', function() {
    $request = new Api();
    $request->teamAll();
});

$route->add('type/.+', function ($name) {
    $request = new Api();
    $request->type($name);
});

$route->add('type', function () {
    $request = new Api();
    $request->typeAll();
});

$route->add('version', function () {
    $request = new Version();
    $request->version();
});

$route->run();
