<?php
namespace api\Model;

use PDO;

class PokemonTiny
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
     * api/pokemon/tiny/all/{id or order}
     * api/pokemon/tiny/generation/{id}
     * api/pokemon/tiny/id/{id}
     * api/pokemon/tiny/name/{intl}/{name}
     * api/pokemon/tiny/order/{id}
     * api/pokemon/tiny/type/{id-name}
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
        $this->sql = 'SELECT
            pokemon.id,
            pokemon.image,
            pokemon.order,
            pokemon.pokedex,
            pokemon.pokedex AS pokedexId,
            pkd.name AS pokedex,
            GROUP_CONCAT(DISTINCT type.id) AS typesid
            FROM pokemon
            LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
            LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
            LEFT JOIN type ON type.id = pktp.type_id';
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

        // format image url
        $result['image'] =  $this->urlPokemonImg . $result['image'];

        // create pokedex array
        $result['pokedex'] = [
            'id' => $result['pokedexId'],
            'name' => $result['pokedex']
        ];
        unset($result['pokedexId']);
        // create type array
        $result['typesid'] = explode(',', $result['typesid']);
        foreach ($result['typesid'] as $type) {
            $result['type'][] = $this->getType($type);
        }
        unset($result['typesid']);

        ksort($result);

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
        /*
        $results['langs'] = explode(',', $results['langs']);
        $results['names'] = explode(',', $results['names']);
        for ($i = 0; $i< count($results['langs']); $i++) {
            [$results['langs'][$i]] = $results['names'][$i];
        }
        */
        //unset($result['langs']);
        //unset($result['names']);

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

    /*
     * api/pokemon/tiny/all/{id or order}
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
     * api/pokemon/tiny/id/{id}
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
     * api/pokemon/tiny/generation/{id}
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
     * api/pokemon/tiny/order/{id}
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
     * api/pokemon/tiny/name/{intl}/{name}
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
     * api/pokemon/tiny/type/{id-name}
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
