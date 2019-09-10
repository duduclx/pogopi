<?php

use api\Model\Api;
use api\Controller\RouteController;

/*
 * Load needed classes
 */
require 'Controller/RouteController.php';
require 'Model/Api.php';

$route = new RouteController();

$route->add('/', function () {
    header("Location: swagger/");
    exit();
});

$route->add('abilitie/id/.+', function($number) {
    $request = new Api();
    $request->abilitieFr($number);
});

$route->add('abilitie/fr/.+', function($name) {
    $request = new Api();
    $request->abilitieFr($name);
});

/*
$route->add('abilitie/.+', function($number) {
    $request = new Api();
    $request->abilitie($number);
});
*/

$route->add('abilitie', function () {
    $request = new Api();
    $request->abilitieAll();
});

$route->add('fastmove/id/.+', function ($number) {
    $request = new Api();
    $request->fastMoveId($number);
});

$route->add('fastmove/fr/.+', function ($name) {
    $request = new Api();
    $request->fastMoveFr($name);
});

$route->add('fastmove/type/.+', function ($name) {
    $request = new Api();
    $request->fastMoveType($name);
});

$route->add('fastmove/max', function() {
    $request = new Api();
    $request->fastMoveMax();
});

$route->add('fastmove', function () {
    $request = new Api();
    $request->fastMoveAll();
});

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

$route->add('pokemon/type/name/.+', function ($number) {
    $request = new Api();
    $request->pokemonTypeName($number);
});

$route->add('pokemon/id/.+', function ($number) {
    $request = new Api();
    $request->pokemonId($number);
});

$route->add('pokemon/generation/.+', function ($number) {
    $request = new Api();
    $request->pokemonGen($number);
});

$route->add('pokemon/name/.+', function ($name) {
    $request = new Api();
    $request->pokemonName($name);
});

$route->add('pokemon/order/.+', function ($number) {
    $request = new Api();
    $request->pokemonOrder($number);
});

$route->add('pokemon', function () {
    $request = new Api();
    $request->pokemonAll();
});

// TODO check reste of method
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
    $request = new Api();
    $request->version();
});

$route->run();
