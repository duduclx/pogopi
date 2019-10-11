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
        <p>Avant d'installer l'API, il faut renseigner vos identifiants. Voilà comment le faire.</p>
        <p>
            <code>$host       = "localhost"; // enter your database hostname</code>
            <br>Comme décrit ici, il faudra renseigné le nom de la <span>base de donnée</span>.
        </p>
        <p>
            <code>$dbname     = "pogopi"; // you can change the database name, then change it in init.sql too !</code>
            <br>Ici, c'est le nom de la base de donnée, vous pouvez laisser le nom par défaut. Si vous le modifier,
            il faudra également modifier le fichier init.sql, comme décrit dans le paragraphe 'installation depuis l'interface web'.
        </p>
        <p>
            <code>$username   = "root"; // put correct database username</code>
            <br>Indiquer le nom d'utilisateur de votre base de donnée.
        </p>
        <p>
            <code>$password   = "cochon"; // put correct database password</code>
            <br>Indiquer le mot de passe de l'utilisateur de votre base de donnée.
        </p>
        <p>
            <code>$url = 'http://localhost/pogopi/api/'; // put correct url</code>
            <br>Indiquer le nom de domaine final, <span>exemple: https://monsite.fr/api/</span>
            <br>Attention, l'url doit bien finir par 'api/'. cela sert à générer le lien vers les ressources (images, sound, etc).
        </p>
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
