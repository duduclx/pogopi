<?php
// check if installed, then ask to delete db before reinstall
require '../www/utilities/check-api-version.php';
// populated DB from data files
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
    $deploy->insertEvolves($evolves);
    $deploy->version(2.1);

    $message = "Les données sont disponibles !";

} catch (PDOException $error) {
    $fail = $error->getMessage();
}
?>

<h1>Installation de Pogopi terminée</h1>
<div class="content">
    <div class="content-full">
        <?php if (isset($response['version'])): ?>
        <div class="install-warning">
            <p>La base de donnée existe déjà !</p>
            <p>Ce script ne met pas à jour la base de donnée, mais la créée.</p>
            <p>Donc, il faut effacer la base de donnée avant de pouvoir continuer l'installation.</p>
        </div>
        <?php endif ?>
        <?php if (!isset($response['version'])): ?>
            <?php if (isset($fail)) : ?>
            <div class="install-warning">
                <p><?= $fail ?></p>
                <p>Ha, y'a un soucis !</p>
                <p>n'hésites pas à regarder le fichier de configuration !</p>
            </div>
            <?php else : ?>
            <div class="center">
                <p><?= $message ?></p>
                <p>Penses à supprimer le dossier <span>install</span>, il ne sert plus à rien et peut poser problème !</p>
                <p>Tu peux aller jeter un oeil sur le <a href="../index.php">site de démo</a>.</p>
                <p>Mais tu peux aussi l'effacer et le remplacer par ta création !</p>
            </div>
            <?php endif ?>
        <?php endif ?>
    </div>
</div>
