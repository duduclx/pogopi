<h1>Documentation de l'installation</h1>
<div class="content">
    <div class="content-full">
        <h3>A propos de l'api !</h3>
        <p>L'api utilise votre base de donnée, et votre nom de domaine grâce au <span>fichier de configuration</span>.
           Il est donc primordial, avant toute opération, d'éditer ce fichier,
           cela peu importe comment vous allez installer l'API.</p>
    </div>
    <div class="content-full">
        <h3>Le fichier de configuration</h3>
        <p></p>
        // if needed, change values
        $host       = "localhost"; // enter your database hostname
        $dbname     = "pogopi"; // you can change the database name, then change it in init.sql too !
        $username   = "root"; // put correct database username
        $password   = "cochon"; // put correct database password

        $url = 'http://localhost/pogopi/api/'; // put correct url
    </div>
    <div class="content-left">
        <h3>Installation depuis l'interface web</h3>
        <p>L'installation se déroule en deux étapes, et cela avec deux cliques de <i class="fas fa-mouse"></i>.</p>
        <ul>
            <li>La première étape construit la base de donnée.</li>
            <li>La deuxième enregistre dans la base de donnée les données stockées dans des tableaux php.</li>
        </ul>
        <p>Cependant, cette méthode impose d'éditer le fichier <span>install/init.sql</span>
           si vous avez changez le nom de la base de donnée dans le fichier de configuration !</p>
        <p>En haut du fichier, on peut trouver les deux lignes suivantes :</p>
        <ul>
            <li>CREATE DATABASE pogopi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;</li>
            <li>use pogopi;</li>
        </ul>
        <p>Il faut remplacer <span>pogopi</span> par le nom de la base de donnée que vous avez utilisez dans le fichier
           de configuration (il est important que ce soit le même nom).</p>
        <p>Par défaut, la base de donnée est <span>pogopi</span>
           et donc si vous n'avez pas changer le nom de la base de donnée dans le fichier de configuration,
           tout va bien se passer. <i class="fas fa-smile-wink"></i></p>
    </div>
    <div class="content-right">
        <h3>Installation depuis le backup</h3>
        <p>Vous pouvez utiliser le backup situé dans le fichier <span>api/backup/pogopi.sql</span>.</p>
        <p>Il vous suffit de vous connecter à votre gestionnaire de base de donnée (généralement phpMyAdmin),
            et de créer une base de donnée avec le nom souhaité.</p>
        <p>Sélectionnez la base de donnée que vous venez de créer et rendez-vous dans l'onglet <span>importer</span>.</p>
        <p>Sélectionnez le fichier pogopi.sql, et cliquez sur <span>exécuter</span>.</p>
        <p>N'oubliez pas que pour que l'API fonctionne, le fichier de configuration doit avoir le bon nom de la
           base de donnée renseigné !</p>
        <p>Le backup peut-être pratique pour de la restauration de donnée, surtout si l'interface web de l'installateur
           à été supprimé.</p>
        <p>A tout moment, il est possible de retrouver ces informations sur le github du projet. <i class="fas fa-smile-wink"></i></p>
    </div>
</div>
