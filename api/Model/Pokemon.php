<?php
namespace api\Model;

use PDO;

class Pokemon
{
    // TODO add getby buddywalk

    private $pdo;
    private $sql;
    private $urlPokemonImg;
    private $urlPokemonScream;
    private $urlPokemonAttack;
    private $urlTypeImg;

    /*
     * ROUTES
     * api/pokemon/max
     * api/pokemon/full/all/{id or order}
     * api/pokemon/full/generation/{id}
     * api/pokemon/full/id/{id}
     * api/pokemon/full/name/{intl}/{name}
     * api/pokemon/full/order/{id}
     * api/pokemon/full/type/{id-name}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        // define url paths
        $this->urlPokemonImg = $urlPokemonImg;
        $this->urlPokemonAttack = $urlPokemonAttack;
        $this->urlPokemonScream = $urlPokemonScream;
        $this->urlTypeImg = $urlTypeImg;

        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT
            pokemon.id,
            pokemon.attack,
            pokemon.attack_spe,
            pokemon.base_experience,
            pokemon.base_happiness,
            pokemon.buddy_walk,
            pokemon.capture_rate,
            pokemon.defense,
            pokemon.defense_spe,
            pokemon.escape_rate,
            pokemon.evolve,
            pokemon.go_attack,
            pokemon.go_defense,
            pokemon.go_hp,
            pokemon.go_pc,
            pokemon.go_stamina,
            pokemon.height,
            pokemon.hp,
            pokemon.image,
            pokemon.order,
            pokemon.pokedex,
            pokemon.scream,
            pokemon.speed,
            pokemon.weight,
            pokemon.pokedex AS pokedexId,
            pkd.name AS pokedex,
            GROUP_CONCAT(DISTINCT abilitie.id) AS abilities,
            GROUP_CONCAT(DISTINCT type.id) AS typesid,
            GROUP_CONCAT(DISTINCT pksp.lang) AS spelangs,
            GROUP_CONCAT(DISTINCT pksp.specie) AS spenames,
            GROUP_CONCAT(DISTINCT fastmove.id) AS fastmovesid,
            GROUP_CONCAT(DISTINCT mainmove.id) AS mainmovesid
            FROM pokemon
            LEFT JOIN pokemon_abilitie AS pkab ON pokemon.id = pkab.pokemon_id
            LEFT JOIN abilitie ON abilitie.id = pkab.abilitie_id
            LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
            LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
            LEFT JOIN type ON type.id = pktp.type_id
            LEFT JOIN pokemon_specie AS pksp ON pokemon.id = pksp.pokemon_id
            LEFT JOIN pokemon_fastmove AS pkfm ON pokemon.id = pkfm.pokemon_id
            LEFT JOIN fastmove ON fastmove.id = pkfm.fastmove_id
            LEFT JOIN pokemon_mainmove AS pkmm ON pokemon.id = pkmm.pokemon_id
            LEFT JOIN mainmove ON mainmove.id = pkmm.mainmove_id';
    }
    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }
    private function formatResult($result)
    {
        // format name
        $result['name'] = $this->getName($result['id']);

        // format stats_go
        $result['stats_go'] = [
            'attack' => $result['go_attack'],
            'defense' => $result['go_defense'],
            'hp' => $result['go_hp'],
            'pc' => $result['go_pc'],
            'stamina' => $result['go_stamina'],
            'buddy_walk' => $result['buddy_walk'],
            'capture_rate' => $result['capture_rate'],
            'escape_rate' => $result['escape_rate']
        ];
        unset($result['go_attack']);
        unset($result['go_defense']);
        unset($result['go_hp']);
        unset($result['go_pc']);
        unset($result['go_stamina']);
        unset($result['buddy_walk']);
        unset($result['capture_rate']);
        unset($result['escape_rate']);

        // format stats_classic
        $result['stats_classic'] = [
            'attack' => $result['attack'],
            'attack_spe' => $result['attack_spe'],
            'base_experience' => $result['base_experience'],
            'base_happiness' => $result['base_happiness'],
            'defense' => $result['defense'],
            'defense_spe' => $result['defense_spe'],
            'hp' => $result['hp'],
            'speed' => $result['speed']
        ];
        unset($result['attack']);
        unset($result['attack_spe']);
        unset($result['defense']);
        unset($result['defense_spe']);
        unset($result['hp']);
        unset($result['speed']);
        unset($result['base_experience']);
        unset($result['base_happiness']);

        // format stats_common
        $result['stats_common'] = [
            'height' => $result['height'],
            'weight' => $result['weight']
        ];
        unset($result['height']);
        unset($result['weight']);

        // format image url
        $result['image'] =  $this->urlPokemonImg . $result['image'];
        // format scream url
        $result['scream'] = $this->urlPokemonScream . $result['scream'];

        // create pokedex array
        $result['pokedex'] = [
            'id' => $result['pokedexId'],
            'name' => $result['pokedex']
        ];
        unset($result['pokedexId']);
        // create specie array
        $result['spelangs'] = explode(',', $result['spelangs']);
        $result['spenames'] = explode(',', $result['spenames']);
        for ($i = 0; $i < count($result['spelangs']); $i++){
            $result['specie'][$result['spelangs'][$i]] = $result['spenames'][$i];
        }
        unset($result['spelangs']);
        unset($result['spenames']);
        // create abilitie array
        if ($result['abilities'] !== null) {
            $result['abilities'] = explode(',', $result['abilities']);
            foreach ($result['abilities'] as $ability) {
                $result['abilitie'][] = $this->getAbilitie($ability);
            }
        } elseif ($result['abilities'] === null) {
            $result['abilitie'] = [];
        }
        unset($result['abilities']);
        // create evolve array
        if ($result['evolve'] !== null) {
            $result['evolve'] = $this->getEvolve($result['evolve']);
        } else {
            $result['evolve'] = [];
        }
        // create type array
        $result['typesid'] = explode(',', $result['typesid']);
        foreach ($result['typesid'] as $type) {
            $result['type'][] = $this->getType($type);
        }
        unset($result['typesid']);
        // create fastmove array
        $result['fastmovesid'] = explode(',', $result['fastmovesid']);
        foreach ($result['fastmovesid'] as $fastmove) {
            $result['fastmove'][] = $this->getFastmove($fastmove);
        }
        unset($result['fastmovesid']);
        // create mainmove array
        $result['mainmovesid'] = explode(',', $result['mainmovesid']);
        foreach ($result['mainmovesid'] as $mainmove) {
            $result['mainmove'][] = $this->getMainmove($mainmove);
        }
        unset($result['mainmovesid']);

        ksort($result);

        return $result;
    }

    private function getAbilitie($number) {
        $sql = 'SELECT
        abilitie.id,
        abilitie.generation,
        GROUP_CONCAT(abilitie.lang) AS langs,
        GROUP_CONCAT(abilitie.description) AS descriptions,
        GROUP_CONCAT(abilitie.name) AS names
        FROM abilitie
        WHERE abilitie.id = :number
        GROUP BY abilitie.id, abilitie.generation';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        $result['langs'] = explode(',', $result['langs']);
        $result['descriptions'] = explode(',', $result['descriptions']);
        $result['names'] = explode(',', $result['names']);

        for ($i = 0; $i < count($result['langs']); $i++) {
            $result[$result['langs'][$i]] = [
                'description' => $result['descriptions'][$i],
                'name' => $result['names'][$i]
            ];
        }
        unset($result['langs']);
        unset($result['descriptions']);
        unset($result['names']);

        return $result;

    }

    private function getEvolve($number)
    {
        $sql = 'SELECT
        evolve.id,
        GROUP_CONCAT(pokemon_id) as ids,
        GROUP_CONCAT(level) as levels,
        GROUP_CONCAT(to_id) as to_ids
        FROM evolve
        WHERE evolve.id = :number
        GROUP BY evolve.id';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        // create evolve array
        $result['ids'] = explode(',', $result['ids']);
        $result['levels'] = explode(',', $result['levels']);
        $result['to_ids'] = explode(',', $result['to_ids']);

        for ($i = 0; $i < count($result['ids']); $i++) {
            if ($result['to_ids'][$i] != "0") {
                $result['level'][$result['levels'][$i]]['from'] = $result['ids'][$i];
                $result['level'][$result['levels'][$i]]['to'][] = $result['to_ids'][$i];
            }
        }

        unset($result['ids']);
        unset($result['levels']);
        unset($result['to_ids']);

        return $result;
    }

    private function getName($number) {
        $sql = 'SELECT
        lang as langs,
        name as names
        FROM pokemon_name
        WHERE pokemon_id = :number
        GROUP BY pokemon_id, langs, names';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        // create name array
        for ($i = 0; $i < count($results); $i++) {
            $result[$results[$i]['langs']] = $results[$i]['names'];
        }

        return $result;
    }

    private function getType($number)
    {
        $sql = 'SELECT 
            type.id,
            type.img,
            GROUP_CONCAT(tn.lang) AS langs,
            GROUP_CONCAT(tn.name) AS names
            FROM type
            LEFT JOIN type_name AS tn ON type.id = tn.type_id
            WHERE type.id = :number
            GROUP BY type.id';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        // format type img url
        $result['img'] = $this->urlTypeImg . $result['img'];

        // type array
        $result['langs'] = explode(',',$result['langs']);
        $result['names'] = explode(',',$result['names']);
        for ($i = 0; $i < count($result['langs']); $i++){
            $result['name'][$result['langs'][$i]] = $result['names'][$i];
        }
        unset($result['langs']);
        unset($result['names']);
        return $result;
    }
    private function getFastmove($number)
    {
        $sql = 'SELECT 
            fastmove.id,
            fastmove.damage,
            fastmove.dps,
            fastmove.energy,
            fastmove.eps,
            fastmove.move_duration AS duration,
            fastmove.sound_fx AS sound,
            fastmove.type AS ti,
            GROUP_CONCAT(DISTINCT fn.lang) AS fl,
            GROUP_CONCAT(DISTINCT fn.name) AS fn,
            GROUP_CONCAT(tn.name) AS tn,
            GROUP_CONCAT(tn.lang) AS tl,
            tp.img AS typeimg
            FROM fastmove
            LEFT JOIN fastmove_name as fn ON fn.fastmove_id = fastmove.id
            LEFT JOIN type AS tp ON tp.id = fastmove.type
            LEFT JOIN type_name AS tn ON tn.type_id = tp.id
            WHERE fastmove.id = :number 
            GROUP BY fastmove.id';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if(empty($result)) {
            $this->error();
            exit;
        }

        // format sound url
        $result['sound'] = $this->urlPokemonAttack . $result['sound'];
        // create name array
        $result['fl'] = explode(',', $result['fl']);
        $result['fn'] = explode(',', $result['fn']);
        for ($i = 0; $i < count($result['fl']); $i++) {
            $result['name'][$result['fl'][$i]] = $result['fn'][$i];
        }
        unset($result['fl']);
        unset($result['fn']);
        // create type array
        $result['type']['id'] = $result['ti'];
        $result['type']['img'] = $this->urlTypeImg . $result['typeimg'];
        $result['tl'] = explode(',',$result['tl']);
        $result['tn'] = explode(',',$result['tn']);
        for ($i = 0; $i < count($result['tl']); $i++){
            $result['type']['name'][$result['tl'][$i]] = $result['tn'][$i];
        }
        unset($result['ti']);
        unset($result['tl']);
        unset($result['tn']);
        unset($result['typeimg']);
        return $result;
    }
    private function getMainmove($number)
    {
        $sql = 'SELECT 
            mainmove.id,
            mainmove.damage,
            mainmove.dps,
            mainmove.energy,
            mainmove.move_duration AS duration,
            mainmove.slot,
            mainmove.sound_fx AS sound,
            mainmove.type AS ti,
            GROUP_CONCAT(DISTINCT mn.lang) AS ml,
            GROUP_CONCAT(CONCAT_WS(\',\', mn.name)) AS mn,
            GROUP_CONCAT(tn.name) AS tn,
            GROUP_CONCAT(tn.lang) AS tl,
            tp.img AS typeimg
            FROM mainmove
            LEFT JOIN mainmove_name AS mn ON mn.mainmove_id = mainmove.id
            LEFT JOIN type AS tp ON mainmove.type = tp.id
            LEFT JOIN type_name AS tn ON tn.type_id = tp.id
            WHERE mainmove.id = :number 
            GROUP BY mainmove.id';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if(empty($result)) {
            $this->error();
            exit;
        }

        // format sound url
        $result['sound'] = $this->urlPokemonAttack . $result['sound'];
        // create name array
        $result['ml'] = explode(',', $result['ml']);
        $result['mn'] = explode(',', $result['mn']);
        for ($i = 0; $i < count($result['ml']); $i++) {
            $result['name'][$result['ml'][$i]] = $result['mn'][$i];
        }
        unset($result['ml']);
        unset($result['mn']);
        // create type array
        $result['type']['id'] = $result['ti'];
        $result['type']['img'] = $this->urlTypeImg . $result['typeimg'];
        $result['tl'] = explode(',',$result['tl']);
        $result['tn'] = explode(',',$result['tn']);
        for ($i = 0; $i < count($result['tl']); $i++){
            $result['type']['name'][$result['tl'][$i]] = $result['tn'][$i];
        }
        unset($result['ti']);
        unset($result['tl']);
        unset($result['tn']);
        unset($result['typeimg']);
        return $result;
    }
    /*
     * api/pokemon/all/{id or order}
     */
    public function pokemonAll($string)
    {
        switch ($string) {
            case 'id':
                $sql = $this->sql . ' GROUP BY pokemon.id ORDER BY pokemon.id ASC';
                break;
            case 'order':
                $sql = $this->sql . ' GROUP BY pokemon.id ORDER BY pokemon.order ASC';
                break;
            default:
                $sql = $this->sql . ' GROUP BY pokemon.id';
                break;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute();
        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }
        foreach ($results as $result) {
            $pokemon[] = $this->formatResult($result);
        }
        header('Content-type: application/json');
        echo json_encode($pokemon, JSON_NUMERIC_CHECK);
    }
    /*
     * api/pokemon/max
     */
    public function pokemonMax()
    {
        $sql = 'SELECT COUNT(id) AS maxPokemon FROM pokemon';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if(empty($result)) {
            $this->error();
            exit;
        }
        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * api/pokemon/id/{id}
     */
    public function pokemonId($number)
    {
        $sql = $this->sql . ' WHERE pokemon.id = :number GROUP BY pokemon.id';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $result = $this->formatResult($result);
        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }
    /*
     * api/pokemon/generation/{id}
     */
    public function pokemonGen($number)
    {
        $sql = $this->sql . ' WHERE pokemon.pokedex = :number GROUP BY pokemon.id';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $results = $query->fetchAll(PDO::FETCH_ASSOC);
        if(empty($results)) {
            $this->error();
            exit;
        }
        foreach ($results as $result) {
            $pokemon[] = $this->formatResult($result);
        }
        header('Content-type: application/json');
        echo json_encode($pokemon, JSON_NUMERIC_CHECK);
    }
    /*
     * api/pokemon/order/{id}
     */
    public function pokemonOrder($number)
    {
        $sql = $this->sql . ' WHERE pokemon.order = :number GROUP BY pokemon.id';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if(empty($result)) {
            $this->error();
            exit;
        }
        $result = $this->formatResult($result);
        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }
    /*
     * api/pokemon/name/{intl}/{name}
     */
    public function pokemonName($intl, $name)
    {
        $sql = 'SELECT pokemon_id FROM pokemon_name
        WHERE lang = :intl
        AND name LIKE CONCAT(\'%\', :name, \'%\')';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':intl' => $intl,
            ':name' => $name
        ]);
        $results = $query->fetchAll(PDO::FETCH_ASSOC);
        if(empty($results)) {
            $this->error();
            exit;
        }
        foreach ($results as $result) {
            $sql = $this->sql . ' WHERE pokemon.id = :number GROUP BY pokemon.id';
            $query = $this->pdo->prepare($sql);
            $query->execute([
                ':number' => $result['pokemon_id']
            ]);
            $result = $query->fetch(PDO::FETCH_ASSOC);
            $pokemon[] = $this->formatResult($result);
        }
        header('Content-type: application/json');
        echo json_encode($pokemon, JSON_NUMERIC_CHECK);
    }
    /*
     * api/pokemon/type/{id-name}
     */
    public function pokemonType($number)
    {
        $base_sql = '
        SELECT type_id, name FROM type_name';
        switch (intval($number)) {
            case '0':
                // is string
                $sql = $base_sql . ' WHERE type_name.name LIKE CONCAT(\'%\', :number, \'%\')';
                break;
            default:
                // is number
                $sql = $base_sql . ' WHERE type_name.type_id = :number';
                break;
        }
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        $sql = 'SELECT pokemon_id, type_id FROM pokemon_type WHERE type_id = :number';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $result['type_id']
        ]);

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }
        foreach ($results as $result) {
            $sql = $this->sql . ' WHERE pokemon.id = :number GROUP BY pokemon.id';
            $query = $this->pdo->prepare($sql);
            $query->execute([
                ':number' => $result['pokemon_id']
            ]);
            $result = $query->fetch(PDO::FETCH_ASSOC);
            $pokemon[] = $this->formatResult($result);
        }
        header('Content-type: application/json');
        echo json_encode($pokemon, JSON_NUMERIC_CHECK);
    }
}
