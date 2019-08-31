<?php

// mysql credentials
require '../api/Controller/config.php';
// deploy script
require 'Deploy.php';

$message = '';

if (isset($_GET['step']) && $_GET['step'] === '1') {
    try {
        //create from init.sql
        $db = new PDO("mysql:host=$host", $username, $password, $options);
        $sql = file_get_contents("init.sql");
        $db->exec($sql);

        $message = "First Step is OK !";

    } catch (PDOException $error) {
        $fail = $error->getMessage();
    }
}

if (isset($_GET['step']) && $_GET['step'] === '2') {
    try {
        // load datas
        require 'datas.php';
        // populate from deploy class
        $deploy = new Deploy($host,$dbname,$username,$password);
        // type needed first
        $deploy->insertTypes($types);
        $deploy->insertAbilities($abilities);
        $deploy->insertTeam($teams);
        $deploy->insertPokeballs($pokeballs);
        $deploy->insertPokedex($pokedexes);
        $deploy->insertFastMoves($fastMoves);
        $deploy->insertMainMoves($mainMoves);
        $deploy->insertPokemons($pokemons);
        $deploy->version(2);

        $message = "Tables populated successfully. <br>
                    Please check api/Controller/config.php and delete mysql root user/password ! <br>
                    Then delete the complete install folder <br>
                    You can have a look to <br>
                    -> <a href='http://github.com/duduclx/pogojs'>js minigame</a>
                    <br>
                    -> <a href='http://github.com/duduclx/pogoweb'>symfony website</a>";

    } catch (PDOException $error) {
        $fail = $error->getMessage();
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>pogopi</title>
    <link rel="stylesheet" href="css/pogopi.css">
    <link rel="stylesheet" href="css/ui-form.css">
</head>
<body>
<div class="container">
    <header class="navbar">
        <img src="data/img/logo.png" alt="pogopi" title="pogopi" width="840" height="560">
    </header>
<!-- first step -->
    <?php if(empty($_GET)) : ?>
    <div class="box welcome">
        <h1>Pogopi installer</h1>
        <p>Wellcome trainer !
        here is the time to setup the database.
        You need:</p>
        <ul>
            <li>PHP 7.1 or more</li>
            <li>Mysql 5.7 or more</li>
            <li><strong>Edit first the config file</strong> with your credentials</li>
            <li>config is located at /api/Controller/config.php</li>
            <li>5 minutes or less</li>

            <li>and maybe have a look at <a href="<?php $_SERVER['PHP_SELF'] ?>../api/">the documentation</a></li>
        </ul>
        <form class="generic-form" method="get">
            <input type="hidden" name="step" value="1">
            <button type="submit" class="next" id="createDB">Create it !</button>
        </form>
    </div>
    <?php endif ?>
<!-- second step -->
    <?php if(isset($_GET['step']) && $_GET['step'] === '1') : ?>
    <div class="box">
        <?php if (isset($fail)) : ?>
        <p><?= $fail ?></p>
        <p>Please, check the install/config.php file !</p>
        <?php else : ?>
        <p><?= $message ?></p>
        <p>Let's populate it !!</p>
            <form class="generic-form" method="get">
                <input type="hidden" name="step" value="2">
                <button type="submit" class="next" id="createDB">Populate it !</button>
            </form>
        <?php endif ?>
    </div>
    <?php endif ?>
<!-- third step -->
    <?php if (isset($_GET['step']) && $_GET['step'] === '2') : ?>
    <div class="box">
        <p><?= $message ?></p>
    </div>
    <?php endif ?>
