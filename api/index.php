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

$route->add('abilitie/.+', function($number) {
    $request = new Api();
    $request->abilitie($number);
});

$route->add('abilitie', function () {
    $request = new Api();
    $request->abilitieAll();
});

$route->add('fastmove/.+', function($number) {
    $request = new Api();
    $request->fastMove($number);
});

$route->add('fastmove', function () {
    $request = new Api();
    $request->fastMoveAll();
});

$route->add('generation/.+', function($number) {
    $request = new Api();
    $request->generation($number);
});

$route->add('generation', function () {
    $request = new Api();
    $request->generationAll();
});

$route->add('mainmove/.+', function($number) {
    $request = new Api();
    $request->mainMove($number);
});

$route->add('mainmove', function () {
    $request = new Api();
    $request->mainMoveAll();
});

$route->add('pokeball/.+', function ($number) {
   $request = new Api();
   $request->pokeball($number);
});

$route->add('pokeball', function () {
   $request = new Api();
   $request->pokeballAll();
});

$route->add('pokedex/.+', function($number) {
    $request = new Api();
    $request->generation($number);
});

$route->add('pokedex', function () {
    $request = new Api();
    $request->generationAll();
});

$route->add('pokemon/id/.+', function ($number) {
    $request = new Api();
    $request->pokemonId($number);
});

$route->add('pokemon/type/.+', function ($number) {
    $request = new Api();
    $request->pokemon($number);
});

$route->add('pokemon', function () {
    $request = new Api();
    $request->pokemonAll();
});

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
