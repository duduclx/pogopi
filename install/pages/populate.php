<?php
// check if installed, then ask to delete db before reinstall
require '../www/utilities/callApi.php';
// check api's version
$get_data = callAPI('GET', 'http://localhost/pogopi/api/version', false);
$version = json_decode($get_data, true);
// create DB from init.sql
try {
    //create from init.sql
    $db = new PDO("mysql:host=$host", $username, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    $sql = file_get_contents("init.sql");
    $db->exec($sql);

    $message = "La base de donnée est créée !";

} catch (PDOException $error) {
    $fail = $error->getMessage();
}
?>

<h1>Installation de Pogopi - à suivre</h1>
<div class="content">
    <div class="content-full">
        <?php if (isset($version['version'])): ?>
            <div class="install-warning">
                <p>La base de donnée existe déjà !</p>
                <p>Ce script ne met pas à jour la base de donnée, mais la créée.</p>
                <p>Donc, il faut effacer la base de donnée avant de pouvoir continuer l'installation.</p>
            </div>
        <?php endif ?>
        <?php if (!isset($version['version'])): ?>
            <?php if (isset($fail)) : ?>
            <div class="install-warning">
                <p><?= $fail ?></p>
                <p>Ha, y'a un soucis !</p>
                <p>n'hésites pas à regarder le fichier de configuration !</p>
            </div>
            <?php else : ?>
            <div class="center">
                <p><?= $message ?></p>
                <p>On peut maintenant sauvegarder les données dedans.</p>
                <p>Cette opération peut prendre un peu de temps, en fonction de ta machine.</p>
                <p>N'hésites donc pas à <span>attendre 2 minutes ...</span></p>
                <form class="right" method="get">
                    <input type="hidden" name="page" value="installed">
                    <button type="submit" class="btn" id="createDB"><i class="fas fa-arrow-right"></i> ON Y VA !</button>
                </form>
            </div>
            <?php endif ?>
        <?php endif ?>
    </div>
</div>
