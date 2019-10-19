<?php
// mysql credentials
require '../api/Controller/config.php';
// deploy script
require 'Deploy.php';
// routing
require 'pages/routing.php';
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../www/css/main.css">
    <link rel="icon" href="../www/images/favicon.ico" />
    <script src="https://kit.fontawesome.com/d3fd741f35.js" crossorigin="anonymous"></script>
    <title><?= $title ?></title>
</head>
<body>
<div class="container">
    <div class="header">
        <a href="index.php" class="brand-logo">
            <img class="logo" src="../www/images/logo.png" alt="pogopi" title="pogopi">
            <div class="brand-logo-name">
                Catch'em All !
            </div>
        </a>
        <nav class="navbar">
            <ul>
                <li class="mobile-nav"><i class="fas fa-bars"></i></li>
                <li class="desktop-nav">
                    <a href="index.php?page=documentation">Documentation</a>
                </li>
                <li class="desktop-nav">
                    <a href="index.php">Installation</a>
                </li>
                <li class="desktop-nav">
                    <a href="../index.php">site de démo</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="mobile-menu invisible">
        <ul>
            <li><a href="index.php?page=documentation">Documentation</a></li>
            <li><a href="index.php">Installation</a></li>
            <li><a href="../index.php">site de démo</a></li>
        </ul>
    </div>
    <div class="mobile-arrow">
        <i class="fas fa-arrow-circle-up"></i>
    </div>
</div>
<main class="container">
    <?php
    include 'pages/' . $page;
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
<script src="../www/js/main.js"></script>
</body>
</html>
