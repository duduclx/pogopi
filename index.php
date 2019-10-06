<?php
/*
 * check api's installation
 */
$installed = '/install/index.php';

/*
 * check api's version
 */
require 'www/utilities/check-api-version.php';

/*
 * fake routing
 */
require 'www/utilities/routing.php';

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="www/css/main.css">
    <link rel="icon" href="www/images/favicon.ico" />
    <script src="https://kit.fontawesome.com/d3fd741f35.js" crossorigin="anonymous"></script>
    <title><?= $title ?></title>
</head>
<body>
<div class="container">
    <div class="header">
        <a href="/pogopi" class="brand-logo">
            <img class="logo" src="www/images/logo.png">
            <div class="brand-logo-name">
                Catch'em All !
            </div>
        </a>
        <nav class="navbar">
            <ul>
                <li class="mobile-nav"><i class="fas fa-bars"></i></li>
                <li class="desktop-nav">
                    <a href="/pogopi/index.php?page=documentation">Documentation</a>
                </li>
                <li class="desktop-nav">
                    <a href="/pogopi/index.php?page=pokemon">Pokemon</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="mobile-menu hide">
        <ul>
            <li><a href="/pogopi/index.php?page=documentation">Documentation</a></li>
            <li><a href="/pogopi/index.php?page=pokemon">Pokemon</a></li>
        </ul>
    </div>
    <div class="mobile-arrow">
        <i class="fas fa-arrow-circle-up"></i>
    </div>
    <div class="version">
        <span>version <?= $response['version'] ?></span>
    </div>
    <?php if (!file_exists($installed)) : ?>
    <div class="install-warning">
        <p>Attention ! <br>N'oubliez pas d'effacer le dossier d'installation !</p>
    </div>
    <?php endif; ?>
</div>

<main class="container">
    <?php
    include 'www/pages/' . $page;
    ?>
</main>
<div class="container">
    <footer class="footer">
    <span><a href="https://github.com/duduclx/pogopi">
            Made by Julien Dutilleul <br>
            <i class="fab fa-github-square"></i>
        </a></span>
    </footer>
</div>
<script src="www/js/main.js"></script>
</body>
</html>
