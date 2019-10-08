<?php
// check if installed, then ask to delete db before reinstall
require '../www/utilities/check-api-version.php';
?>

<h1>Installation de Pogopi</h1>
<div class="content">
    <div class="content-full ">
        <?php if (isset($response['version'])): ?>
        <div class="install-warning">
            <p>La base de donnée existe déjà !</p>
            <p>Ce script ne met pas à jour la base de donnée, mais la créée.</p>
            <p>Donc, il faut effacer la base de donnée avant de pouvoir continuer l'installation.</p>
        </div>
        <?php endif ?>
        <?php if (!isset($response['version'])): ?>
        <div class="center">
            <p>Bienvenu entraineur !
                Il est temps d'installer l'API !
                Pour cela, tu as besoin de :</p>
            <ul>
                <li>PHP 7.1 ou <i class="fas fa-plus"></i>.</li>
                <li>Mysql 5.7 ou <i class="fas fa-plus"></i>.</li>
                <li><strong>Edites le fichier de configutaion</strong> avec tes identifiants.</li>
                <li>Le fichier de configuration se trouve ici <span>/api/Controller/config.php</span></li>
                <li>3 cliques de <i class="fas fa-mouse"></i> ..</li>
            </ul>
            <p>Si tu ne sais pas ce que tu fais, profites-en pour lire la
                <a href="index.php?page=documentation">Documentation</a> !</p>
        </div>

        <form class="right" method="get">
            <input type="hidden" name="page" value="populated">
            <button type="submit" class="btn" id="createDB"><i class="fas fa-arrow-right"></i> CONTINUER !</button>
        </form>
        <?php endif ?>
    </div>
</div>
