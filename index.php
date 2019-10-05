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
    <title><?= $title ?></title>
</head>
<body>
<div class="container">
    <div class="header">
        <a href="/pogopi" class="brand-logo">
            <img class="logo" src="www/images/logo.png">
            <div class="brand-logo-name">Catch'en All !
                <br>
                <span class="version">version <?= $response['version'] ?></span>
            </div>
        </a>
        <nav class="navbar">
            <ul>
                <li>
                    <a href="/pogopi">Accueil</a>
                </li>
                <li>
                    <a href="/pogopi/index.php?page=pokemon">Pokemon</a>
                </li>
                <?php if (!file_exists($installed)) : ?>
                <li>
                    <a href="/pogopi/install/index.php">Installation</a>
                </li>
                <?php endif; ?>
            </ul>
        </nav>
    </div>
    <?php if (!file_exists($installed)) : ?>
    <div class="install-warning">
        <p>Becarefull, if you have installed the api, don't forget to remove the install folder !</p>
    </div>
    <?php endif; ?>
</div>

<main class="container">
    <?php
    include 'www/pages/' . $page;
    ?>
</main>
</body>
</html>
