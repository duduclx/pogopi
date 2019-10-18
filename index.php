<?php
// check api's installation
$installed = '/install/index.php';
// import callApi function
require 'www/utilities/callApi.php';
// check api's version
$get_data = callAPI('GET', 'http://localhost/pogopi/api/version', false);
$version = json_decode($get_data, true);
// fake routing
require 'www/utilities/routing.php';
?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="www/css/main.css">
    <?php if (isset($_GET['page']) && $_GET['page'] === 'battle'): ?>
    <link rel="stylesheet" href="www/css/battle.css">
    <?php endif ?>
    <link rel="icon" href="www/images/favicon.ico" />
    <script src="https://kit.fontawesome.com/d3fd741f35.js" crossorigin="anonymous"></script>
    <title><?= $title ?></title>
</head>
<body>
<div class="container">
    <div class="header">
        <a href="index.php" class="brand-logo">
            <img class="logo" src="www/images/logo.png" alt="pogopi" title="pogopi">
            <div class="brand-logo-name">
                Catch'em All !
            </div>
        </a>
        <nav class="navbar">
            <ul>
                <li class="mobile-nav"><i class="fas fa-bars"></i></li>
                <?php if (!isset($version['version'])) : ?>
                <li>
                    <a href="install/index.php">Installation</a>
                </li>
                <?php endif ?>
                <li class="desktop-nav">
                    <a href="index.php?page=documentation">Documentation</a>
                </li>
                <li class="desktop-nav">
                    <a href="index.php?page=pokemon">Pokemon</a>
                </li>
                <li class="desktop-nav">
                    <a href="index.php?page=battle">Battle</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="mobile-menu invisible">
        <ul>
            <li><a href="index.php">Accueil</a></li>
            <?php if (!isset($version['version'])) : ?>
                <li>
                    <a href="install/index.php">Installation</a>
                </li>
            <?php endif ?>
            <li><a href="index.php?page=documentation">Documentation</a></li>
            <li><a href="index.php?page=pokemon">Pokemon</a></li>
            <li><a href="index.php?page=battle">Battle</a></li>
        </ul>
    </div>
    <div class="mobile-arrow">
        <i class="fas fa-arrow-circle-up"></i>
    </div>

    <?php if (isset($version['version'])) : ?>
    <div class="version">
        <span>version <?= $version['version'] ?></span>
    </div>
        <?php if (!file_exists($installed)) : ?>
            <div class="install-warning">
                <p>Attention ! <br>N'oubliez pas d'effacer le dossier d'installation !</p>
            </div>
        <?php endif; ?>
    <?php elseif (!isset($version['version'])) : ?>
    <div class="install-warning">
        <p>Pour <span>installer l'API</span> <a href="install/index.php">CLIQUEZ ICI</a>.</p>
    </div>
    <?php endif ?>
</div>

<main class="container">
    <?php
    include 'www/pages/' . $page;
    ?>
</main>
<div class="container">
    <footer class="footer">
    <span><a href="https://github.com/duduclx/pogopi" target="_blank">
            Made by Julien Dutilleul <br>
            <i class="fab fa-github-square fa-2x"></i>
        </a></span>
    </footer>
</div>
<script src="www/js/main.js"></script>
</body>
</html>
