<?php
namespace api\Model;
use PDO;
use Api\Model\Type;
class Pokemon
{
    private $pdo;
    private $sql;
    /*
     * ROUTES
     * api/pokemon/all
     * api/pokemon/max
     * api/pokemon/generation/{id}
     * api/pokemon/id/{id}
     * api/pokemon/name/{intl}/{name}
     * api/pokemon/order/{id}
     * api/pokemon/type/{id-name}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT
            pokemon.id,
            pokemon.attack,
            pokemon.defense,
            pokemon.height,
            pokemon.hp,
            pokemon.image,
            pokemon.order,
            pokemon.pokedex,
            pokemon.scream,
            pokemon.weight,
            pokemon.pokedex,
            pkd.name AS pokedex,
            GROUP_CONCAT(DISTINCT pkmn.lang) AS nameslang,
            GROUP_CONCAT(pkmn.name) AS namesname,
            GROUP_CONCAT(DISTINCT type.id) AS typesid,
            GROUP_CONCAT(DISTINCT fastmove.id) AS fastmovesid,
            GROUP_CONCAT(DISTINCT mainmove.id) AS mainmovesid
            FROM pokemon
            LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
            LEFT JOIN pokemon_name AS pkmn on pokemon.id = pkmn.pokemon_id
            LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
            LEFT JOIN type ON type.id = pktp.type_id
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
        // create name array
        $result['nameslang'] = explode(',', $result['nameslang']);
        $result['namesname'] = explode(',', $result['namesname']);
        for ($i = 0; $i< count($result['nameslang']); $i++) {
            $result['name'][$result['nameslang'][$i]] = $result['namesname'][$i];
        }
        unset($result['nameslang']);
        unset($result['namesname']);
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
        $result['type']['img'] = $result['typeimg'];
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
        $result['type']['img'] = $result['typeimg'];
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
     * api/pokemon/all
     */
    public function pokemonAll()
    {
        $sql = $this->sql . ' GROUP BY pokemon.id';
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
     * api/pokemon/id/{number}
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
