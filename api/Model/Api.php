<?php


namespace api\Model;

use PDO;

class Api
{

    private $pdo;

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO("mysql:dbname=$dbname;host=$host;charset=UTF8", $username, $password);
    }

    public function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);

    }

    public function abilitie($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = 'SELECT 
                        id,
                        description,
                        name
                        FROM abilitie
                        WHERE names LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                        id,
                        description,
                        name
                        FROM abilitie
                        WHERE id = :name';
                break;
        }
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function abilitieAll()
    {
        $query = $this->pdo->prepare('
                        SELECT 
                        id,
                        description,
                        name
                        FROM abilitie');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * return fastmove by id
     * api/fastmove/id/{id}
     */
    public function fastMoveId($number)
    {
        $sql = 'SELECT 
                fast_move.id,
                fast_move.damage,
                fast_move.dps,
                fast_move.energy,
                fast_move.eps,
                fast_move.move_duration,
                fast_move.name,
                fast_move.sound_fx,
                fast_move.type,
                tp.name AS typename,
                tp.img AS typeimg
                FROM fast_move
                LEFT JOIN type AS tp ON type = tp.id
                WHERE fast_move.id = :number';

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $result['type'] = [
            'id' => $result['type'],
            'name' => $result['typename'],
            'img' => $result['typeimg']
        ];
        unset($result['typename']);
        unset($result['typeimg']);

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * return fastmove by name Fr
     */
    public function fastMoveFr($name)
    {
        $sql = 'SELECT 
                fast_move.id,
                fast_move.damage,
                fast_move.dps,
                fast_move.energy,
                fast_move.eps,
                fast_move.move_duration,
                fast_move.name,
                fast_move.sound_fx,
                fast_move.type,
                tp.name AS typename,
                tp.img AS typeimg
                FROM fast_move
                LEFT JOIN type AS tp ON type = tp.id
                WHERE fast_move.name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        foreach ($result AS $row) {
            $row['type'] = [
                'id' => $row['type'],
                'name' => $row['typename'],
                'img' => $row['typeimg']
            ];
            unset($row['typename']);
            unset($row['typeimg']);
            $fastmove[] = $row;
        }

        header('Content-type: application/json');
        echo json_encode($fastmove);
    }

    /*
     * return fastmove by type Fr
     */
    public function fastMoveType($name)
    {
        $sql = 'SELECT 
                fast_move.id,
                fast_move.damage,
                fast_move.dps,
                fast_move.energy,
                fast_move.eps,
                fast_move.move_duration,
                fast_move.name,
                fast_move.sound_fx,
                fast_move.type,
                tp.name AS typename,
                tp.img AS typeimg
                FROM fast_move
                LEFT JOIN type AS tp ON type = tp.id
                WHERE tp.name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        foreach ($result AS $row) {
            $row['type'] = [
                'id' => $row['type'],
                'name' => $row['typename'],
                'img' => $row['typeimg']
            ];
            unset($row['typename']);
            unset($row['typeimg']);
            $fastmove[] = $row;
        }

        header('Content-type: application/json');
        echo json_encode($fastmove);
    }

    /*
     * return count of fastmove
     */
    public function fastMoveMax()
    {
        $sql = 'SELECT 
                COUNT(fast_move.id) AS totalFastMove
                FROM fast_move';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function fastMoveAll()
    {
        $sql = 'SELECT 
                fast_move.id,
                fast_move.damage,
                fast_move.dps,
                fast_move.energy,
                fast_move.eps,
                fast_move.move_duration,
                fast_move.name,
                fast_move.sound_fx,
                fast_move.type,
                tp.name AS typename,
                tp.img AS typeimg
                FROM fast_move
                LEFT JOIN type AS tp ON type = tp.id';

        $query = $this->pdo->prepare($sql);

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        foreach ($result AS $row) {
            $row['type'] = [
                'id' => $row['type'],
                'name' => $row['typename'],
                'img' => $row['typeimg']
            ];
            unset($row['typename']);
            unset($row['typeimg']);
            $fastmove[] = $row;
        }

        header('Content-type: application/json');
        echo json_encode($fastmove);
    }

    /*
     * return generation (pokedex) by name Fr
     */
    public function generationFr($name)
    {
        $sql = 'SELECT id, name FROM pokedex
                WHERE name LIKE CONCAT(\'%\', :name, \'%\')';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * return generation by Id
     */
    public function generationId($number)
    {
        $sql = 'SELECT id, name FROM pokedex
                WHERE id = :number';
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * return count of generation
     */
    public function generationMax()
    {
        $sql = 'SELECT COUNT(id) AS totalGeneration FROM pokedex';

        $query = $this->pdo->prepare($sql);

        $query->execute();

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function generationAll()
    {
        $sql = 'SELECT id, name FROM pokedex';

        $query = $this->pdo->prepare($sql);

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function mainMove($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = 'SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        move_duration,
                        name,
                        slot,
                        sound_fx,
                        type
                        FROM main_move
                        WHERE name LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        move_duration,
                        name,
                        slot,
                        sound_fx,
                        type
                        FROM main_move
                        WHERE id = :name';
                break;
        }
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function mainMoveAll()
    {
        $query = $this->pdo->prepare('
                        SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        move_duration,
                        name,
                        slot,
                        sound_fx,
                        type
                        FROM main_move');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function pokeball($number)
    {
        switch (intval($number)) {
            case '0':
                // is string
                $sql = 'SELECT
                       id,
                       generation,
                       name,
                       img
                       FROM pokeball
                       WHERE name LIKE CONCAT(\'%\', :number, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                       id,
                       generation,
                       name,
                       img
                       FROM pokeball
                       WHERE id = :number';
                break;
        }

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function pokeballAll()
    {
        $query = $this->pdo->prepare(
            'SELECT 
                      id,
                      generation,
                      name,
                      img
                      FROM pokeball');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }


    /*
     * return a pokemon by ID
     * api/pokemon/id/{number}
     */
    public function pokemonId($number)
    {
        $sql = 'SELECT
            pokemon.id,
            pokemon.attack,
            pokemon.defense,
            pokemon.height,
            pokemon.hp,
            pokemon.image,
            pokemon.name,
            pokemon.order,
            pokemon.pokedex,
            pokemon.scream,
            pokemon.weight,
            pokemon.pokedex,
            pkd.name AS pokedex,
            GROUP_CONCAT(DISTINCT type.id) AS typesid,
            GROUP_CONCAT(DISTINCT type.img) AS typesimg,
            GROUP_CONCAT(DISTINCT type.name) AS typesname,
            GROUP_CONCAT(DISTINCT abilitie.id) AS abilitiesid,
            GROUP_CONCAT(DISTINCT abilitie.name) AS abilitiesname,
            GROUP_CONCAT(DISTINCT abilitie.description) AS abilitiesdescription,
            GROUP_CONCAT(DISTINCT fast_move.id) AS fastmovesid,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.damage)) AS fastmovesdamage,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.dps)) AS fastmovesdps,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.energy)) AS fastmovesenergy,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.eps)) AS fastmoveseps,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.move_duration)) AS fastmovesmove,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.name)) AS fastmovesname,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.sound_fx)) AS fastmovessound,
            GROUP_CONCAT(CONCAT_WS(\',\', fast_move.type)) AS fastmovestype,
            GROUP_CONCAT(fmtp.name) AS fastmovestypename,
            GROUP_CONCAT(fmtp.img) AS fastmovestypeimg,
            GROUP_CONCAT(DISTINCT main_move.id) AS mainmovesid,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.damage)) AS mainmovesdamage,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.dps)) AS mainmovesdps,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.energy)) AS mainmovesenergy,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.move_duration)) AS mainmovesmove,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.name)) AS mainmovesname,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.slot)) AS mainmovesslot,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.sound_fx)) AS mainmovessound,
            GROUP_CONCAT(CONCAT_WS(\',\', main_move.type)) AS mainmovestype,
            GROUP_CONCAT(mmtp.name) AS mainmovestypename,
            GROUP_CONCAT(mmtp.img) AS mainmovestypeimg 
            FROM `pokemon`
            LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
            LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
            LEFT JOIN type ON type.id = pktp.type_id
            LEFT JOIN pokemon_abilitie AS pkab ON pokemon.id = pkab.pokemon_id
            LEFT JOIN abilitie ON abilitie.id = pkab.abilitie_id
            LEFT JOIN pokemon_fast_move AS pkfm ON pokemon.id = pkfm.pokemon_id
            LEFT JOIN fast_move ON fast_move.id = pkfm.fast_move_id
            LEFT JOIN type AS fmtp ON fast_move.type = fmtp.id
            LEFT JOIN pokemon_main_move AS pkmm ON pokemon.id = pkmm.pokemon_id
            LEFT JOIN main_move ON main_move.id = pkmm.main_move_id
            LEFT JOIN type AS mmtp ON main_move.type = mmtp.id
            WHERE pokemon.id = :number
            GROUP BY pokemon.id
            ';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        // create type array
        $result['typesname'] = explode(',', $result['typesname']);
        $result['typesimg'] = explode(',', $result['typesimg']);
        $result['typesid'] = explode(',', $result['typesid']);
        for($i = 0; $i < count($result['typesid']); $i++) {
            $result['type'][$i] = [
                'id' => $result['typesid'][$i],
                'name' => $result['typesname'][$i],
                'image' => $result['typesimg'][$i]
            ];
        }
        unset($result['typesid']);
        unset($result['typesimg']);
        unset($result['typesname']);

        // create abilitie array
        $result['abilitiesid'] = explode(',', $result['abilitiesid']);
        $result['abilitiesname'] = explode(',', $result['abilitiesname']);
        $result['abilitiesdescription'] = explode(',', $result['abilitiesdescription']);
        for($i = 0; $i < count($result['abilitiesid']); $i++) {
            $result['abilitie'][$i] = [
                'id' => $result['abilitiesid'][$i],
                'name' => $result['abilitiesname'][$i],
                'description' => $result['abilitiesdescription'][$i]
            ];
        }
        unset($result['abilitiesid']);
        unset($result['abilitiesname']);
        unset($result['abilitiesdescription']);

        // create fastmove array
        $result['fastmovesid'] = explode(',', $result['fastmovesid']);
        $result['fastmovesdamage'] = explode(',', $result['fastmovesdamage']);
        $result['fastmovesdps'] = explode(',', $result['fastmovesdps']);
        $result['fastmovesenergy'] = explode(',', $result['fastmovesenergy']);
        $result['fastmoveseps'] = explode(',', $result['fastmoveseps']);
        $result['fastmovesmove'] = explode(',', $result['fastmovesmove']);
        $result['fastmovesname'] = explode(',', $result['fastmovesname']);
        $result['fastmovessound'] = explode(',', $result['fastmovessound']);
        $result['fastmovestype'] = explode(',', $result['fastmovestype']);
        $result['fastmovestypename'] = explode(',', $result['fastmovestypename']);
        $result['fastmovestypeimg'] = explode(',', $result['fastmovestypeimg']);
        for($i = 0; $i < count($result['fastmovesid']); $i++) {
            $result['fastMove'][$i] = [
                'id' => $result['fastmovesid'][$i],
                'damage' => $result['fastmovesdamage'][$i * ( count($result['fastmovesdamage']) / count($result['fastmovesid']))],
                'dps' => $result['fastmovesdps'][$i * ( count($result['fastmovesdps']) / count($result['fastmovesid']))],
                'energy' => $result['fastmovesenergy'][$i * ( count($result['fastmovesenergy']) / count($result['fastmovesid']))],
                'eps' => $result['fastmoveseps'][$i * ( count($result['fastmoveseps']) / count($result['fastmovesid']))],
                'duration' => $result['fastmovesmove'][$i * ( count($result['fastmovesmove']) / count($result['fastmovesid']))],
                'name' => $result['fastmovesname'][$i * ( count($result['fastmovesname']) / count($result['fastmovesid']))],
                'sound' => $result['fastmovessound'][$i * ( count($result['fastmovessound']) / count($result['fastmovesid']))]
            ];
            $result['fastMove'][$i]['type'] = [
                'id' => $result['fastmovestype'][$i * ( count($result['fastmovestype']) / count($result['fastmovesid']))],
                'name' => $result['fastmovestypename'][$i * ( count($result['fastmovestypename']) / count($result['fastmovesid']))],
                'img' => $result['fastmovestypeimg'][$i * ( count($result['fastmovestypeimg']) / count($result['fastmovesid']))]
            ];
        }
        unset($result['fastmovesid']);
        unset($result['fastmovesdamage']);
        unset($result['fastmovesdps']);
        unset($result['fastmovesenergy']);
        unset($result['fastmoveseps']);
        unset($result['fastmovesmove']);
        unset($result['fastmovesname']);
        unset($result['fastmovessound']);
        unset($result['fastmovestype']);
        unset($result['fastmovestypename']);
        unset($result['fastmovestypeimg']);

        // create mainmove array
        $result['mainmovesid'] = explode(',', $result['mainmovesid']);
        $result['mainmovesdamage'] = explode(',', $result['mainmovesdamage']);
        $result['mainmovesdps'] = explode(',', $result['mainmovesdps']);
        $result['mainmovesenergy'] = explode(',', $result['mainmovesenergy']);
        $result['mainmovesmove'] = explode(',', $result['mainmovesmove']);
        $result['mainmovesname'] = explode(',', $result['mainmovesname']);
        $result['mainmovesslot'] = explode(',', $result['mainmovesslot']);
        $result['mainmovessound'] = explode(',', $result['mainmovessound']);
        $result['mainmovestype'] = explode(',', $result['mainmovestype']);
        $result['mainmovestypename'] = explode(',', $result['mainmovestypename']);
        $result['mainmovestypeimg'] = explode(',', $result['mainmovestypeimg']);
        for($i = 0; $i < count($result['mainmovesid']); $i++) {
            $result['mainMove'][$i] = [
                'id' => $result['mainmovesid'][$i],
                'damage' => $result['mainmovesdamage'][$i * ( count($result['mainmovesdamage']) / count($result['mainmovesid']))],
                'dps' => $result['mainmovesdps'][$i * ( count($result['mainmovesdps']) / count($result['mainmovesid']))],
                'energy' => $result['mainmovesenergy'][$i * ( count($result['mainmovesenergy']) / count($result['mainmovesid']))],
                'duration' => $result['mainmovesmove'][$i * ( count($result['mainmovesmove']) / count($result['mainmovesid']))],
                'name' => $result['mainmovesname'][$i * ( count($result['mainmovesname']) / count($result['mainmovesid']))],
                'slot' => $result['mainmovesslot'][$i * ( count($result['mainmovesslot']) / count($result['mainmovesid']))],
                'sound' => $result['mainmovessound'][$i * ( count($result['mainmovessound']) / count($result['mainmovesid']))]
            ];
            $result['mainMove'][$i]['type'] = [
                'id' => $result['mainmovestype'][$i * ( count($result['mainmovestype']) / count($result['mainmovesid']))],
                'name' => $result['mainmovestypename'][$i * ( count($result['mainmovestypename']) / count($result['mainmovesid']))],
                'img' => $result['mainmovestypeimg'][$i * ( count($result['mainmovestypeimg']) / count($result['mainmovesid']))]
            ];
        }
        unset($result['mainmovesid']);
        unset($result['mainmovesdamage']);
        unset($result['mainmovesdps']);
        unset($result['mainmovesenergy']);
        unset($result['mainmovesmove']);
        unset($result['mainmovesname']);
        unset($result['mainmovesslot']);
        unset($result['mainmovessound']);
        unset($result['mainmovestype']);
        unset($result['mainmovestypename']);
        unset($result['mainmovestypeimg']);

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function pokemonGen($number)
    {
        $sql = 'SELECT
                    pokemon.id,
                    pokemon.attack,
                    pokemon.defense,
                    pokemon.height,
                    pokemon.hp,
                    pokemon.image,
                    pokemon.name,
                    pokemon.order,
                    pokemon.pokedex,
                    pokemon.scream,
                    pokemon.weight,
                    pokemon.pokedex,
                    pkd.name AS pokedex,
                    GROUP_CONCAT(DISTINCT type.name) AS types,
                    GROUP_CONCAT(DISTINCT abilitie.name) AS abilities,
                    GROUP_CONCAT(DISTINCT fast_move.name) AS fastmoves
                    FROM `pokemon`
                    LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
                    LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
                    LEFT JOIN type ON type.id = pktp.type_id
                    LEFT JOIN pokemon_abilitie AS pkab ON pokemon.id = pkab.pokemon_id
                    LEFT JOIN abilitie ON abilitie.id = pkab.abilitie_id
                    LEFT JOIN pokemon_fast_move AS pkfm ON pokemon.id = pkfm.pokemon_id
                    LEFT JOIN fast_move ON fast_move.id = pkfm.fast_move_id
                    WHERE pkd.id = :number
                    GROUP BY pokemon.id
                ';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        $pokemon = [];

        $result['type'] = explode(',', $result['types']);
        unset($result['types']);
        $result['abilitie'] = explode(',', $result['abilities']);
        unset($result['abilities']);
        $result['fastmove'] = explode(',', $result['fastmoves']);
        unset($result['fastmoves']);
        $pokemon = $result;

        header('Content-type: application/json');
        echo json_encode($pokemon);
    }

    /*
     *
     */
    public function pokemonOriginal($name, $number)
    {
        $base_sql = 'SELECT
                    pokemon.id,
                    pokemon.attack,
                    pokemon.defense,
                    pokemon.height,
                    pokemon.hp,
                    pokemon.image,
                    pokemon.name,
                    pokemon.order,
                    pokemon.pokedex,
                    pokemon.scream,
                    pokemon.weight,
                    pokemon.pokedex,
                    pkd.name AS pokedex_name,
                    GROUP_CONCAT(CONCAT(\'[\', type.name,\']\')) type
                    FROM `pokemon`
                    LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
                    LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
                    LEFT JOIN type AS type ON pktp.type_id = type.id
                ';
        switch ($name) {
            case 'generation':
            case 'pokedex':
                $sql = "$base_sql WHERE pokemon.pokedex = :number";
                break;
            case 'id':
                $sql = "$base_sql WHERE pokemon.id = :number GROUP BY pokemon.id";
                break;
            case 'order':
                $sql = "$base_sql WHERE pokemon.order = :number";
                break;
            case 'en':
                $sql = "$base_sql WHERE pokemon.name_en LIKE CONCAT('%', :number, '%')";
                break;
            case 'fr':
                $sql = "$base_sql WHERE pokemon.name LIKE CONCAT('%', :number, '%')";
                break;
            case 'type':
                $sql = "$base_sql
                        WHERE pokemon.type_1 = :number
                        OR pokemon.type_2 = :number";
                break;
            default:
                return $result['error'] = 400;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result, JSON_PRETTY_PRINT);
    }

    /*
     * return all pokemons in array
     * api/pokemon/
     */
    public function pokemonAll()
    {
        $base_sql = 'SELECT
                    pokemon.id,
                    pokemon.attack,
                    pokemon.attack_max,
                    pokemon.attack_spe,
                    pokemon.base_experience,
                    pokemon.base_happiness,
                    pokemon.buddy_walk,
                    pokemon.capture_rate,
                    pokemon.defense,
                    pokemon.defense_max,
                    pokemon.defense_spe,
                    pokemon.escape_rate,
                    pokemon.height,
                    pokemon.image,
                    pokemon.name_en,
                    pokemon.name_fr,
                    pokemon.order,
                    pokemon.pc_max,
                    pokemon.pv,
                    pokemon.pv_max,
                    pokemon.scream,
                    pokemon.specie_en,
                    pokemon.specie_fr,
                    pokemon.speed,
                    pokemon.stamina_max,
                    pokemon.weight,
                    pokemon.abilitie_1,
                    ab1.description_en AS abilitie_1_description_en,
                    ab1.description_fr AS abilitie_1_description_fr,
                    ab1.name_en AS abilitie_1_name_en,
                    ab1.name_fr AS abilitie_1_name_fr,
                    pokemon.abilitie_2,
                    ab2.description_en AS abilitie_2_description_en,
                    ab2.description_fr AS abilitie_2_description_fr,
                    ab2.name_en AS abilitie_2_name_en,
                    ab2.name_fr AS abilitie_2_name_fr,
                    pokemon.abilitie_3,
                    ab3.description_en AS abilitie_3_description_en,
                    ab3.description_fr AS abilitie_3_description_fr,
                    ab3.name_en AS abilitie_3_name_en,
                    ab3.name_fr AS abilitie_3_name_fr,
                    pokemon.fast_move_1,
                    fm1.damage AS fast_move_1_damage,
                    fm1.dps AS fast_move_1_dps,
                    fm1.energy AS fast_move_1_energy,
                    fm1.eps AS fast_move_1_eps,
                    fm1.move_duration AS fast_move_1_move_duration,
                    fm1.name_en AS fast_move_1_name_en,
                    fm1.name_fr AS fast_move_1_name_fr,
                    fm1.sound_fx AS fast_move_1_sound_fx,
                    pokemon.fast_move_2,
                    fm2.damage AS fast_move_2_damage,
                    fm2.dps AS fast_move_2_dps,
                    fm2.energy AS fast_move_2_energy,
                    fm2.eps AS fast_move_2_eps,
                    fm2.move_duration AS fast_move_2_move_duration,
                    fm2.name_en AS fast_move_2_name_en,
                    fm2.name_fr AS fast_move_2_name_fr,
                    fm2.sound_fx AS fast_move_2_sound_fx,
                    pokemon.fast_move_3,
                    fm3.damage AS fast_move_3_damage,
                    fm3.dps AS fast_move_3_dps,
                    fm3.energy AS fast_move_3_energy,
                    fm3.eps AS fast_move_3_eps,
                    fm3.move_duration AS fast_move_3_move_duration,
                    fm3.name_en AS fast_move_3_name_en,
                    fm3.name_fr AS fast_move_3_name_fr,
                    fm3.sound_fx AS fast_move_3_sound_fx,
                    pokemon.main_move_1,
                    mm1.damage AS main_move_1_damage,
                    mm1.dps AS main_move_1_dps,
                    mm1.energy AS main_move_1_energy,
                    mm1.move_duration AS main_move_1_move_duration,
                    mm1.name_en AS main_move_1_name_en,
                    mm1.name_fr AS main_move_1_name_fr,
                    mm1.slot AS main_move_1_slot,
                    mm1.sound_fx AS main_move_1_sound_fx,
                    pokemon.main_move_2,
                    mm2.damage AS main_move_2_damage,
                    mm2.dps AS main_move_2_dps,
                    mm2.energy AS main_move_2_energy,
                    mm2.move_duration AS main_move_2_move_duration,
                    mm2.name_en AS main_move_2_name_en,
                    mm2.name_fr AS main_move_2_name_fr,
                    mm2.slot AS main_move_2_slot,
                    mm2.sound_fx AS main_move_2_sound_fx,
                    pokemon.main_move_3,
                    mm3.damage AS main_move_3_damage,
                    mm3.dps AS main_move_3_dps,
                    mm3.energy AS main_move_3_energy,
                    mm3.move_duration AS main_move_3_move_duration,
                    mm3.name_en AS main_move_3_name_en,
                    mm3.name_fr AS main_move_3_name_fr,
                    mm3.slot AS main_move_3_slot,
                    mm3.sound_fx AS main_move_3_sound_fx,
                    pokemon.main_move_4,
                    mm4.damage AS main_move_4_damage,
                    mm4.dps AS main_move_4_dps,
                    mm4.energy AS main_move_4_energy,
                    mm4.move_duration AS main_move_4_move_duration,
                    mm4.name_en AS main_move_4_name_en,
                    mm4.name_fr AS main_move_4_name_fr,
                    mm4.slot AS main_move_4_slot,
                    mm4.sound_fx AS main_move_4_sound_fx,
                    pokemon.pokedex,
                    pkd.name AS pokedex_name,
                    pokemon.type_1,
                    type1.img AS type_1_img,
                    type1.name_en AS type_1_name_en,
                    type1.name_fr AS type_1_name_fr,
                    pokemon.type_2,
                    type2.img AS type_2_img,
                    type2.name_en AS type_2_name_en,
                    type2.name_fr AS type_2_name_fr
                    FROM `pokemon`
                    LEFT JOIN abilitie AS ab1 ON pokemon.abilitie_1 = ab1.id
                    LEFT JOIN abilitie AS ab2 ON pokemon.abilitie_2 = ab2.id
                    LEFT JOIN abilitie AS ab3 ON pokemon.abilitie_3 = ab3.id
                    LEFT JOIN fast_move AS fm1 ON pokemon.fast_move_1 = fm1.id
                    LEFT JOIN fast_move AS fm2 ON pokemon.fast_move_2 = fm2.id
                    LEFT JOIN fast_move AS fm3 ON pokemon.fast_move_3 = fm3.id
                    LEFT JOIN main_move AS mm1 ON pokemon.main_move_1 = mm1.id
                    LEFT JOIN main_move AS mm2 ON pokemon.main_move_2 = mm2.id
                    LEFT JOIN main_move AS mm3 ON pokemon.main_move_3 = mm3.id
                    LEFT JOIN main_move AS mm4 ON pokemon.main_move_4 = mm4.id
                    LEFT JOIN pokedex AS pkd ON pokemon.pokedex = pkd.id
                    LEFT JOIN type AS type1 ON pokemon.type_1 = type1.id
                    LEFT JOIN type AS type2 ON pokemon.type_2 = type2.id 
                    ';

        $sql = "$base_sql ORDER BY pokemon.id";

        $query = $this->pdo->prepare($sql);

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function team($number)
    {
        //check if lang exist in request
        switch (intval($number)) {
            case '0':
                // is string
                $sql = 'SELECT 
                       id,
                       color_en,
                       color_fr,
                       img_player,
                       img_pngXl,
                       img_pngXs,
                       img_svg,
                       name_en,
                       name_fr,
                       player_en,
                       player_fr
                       FROM team
                       WHERE name_en LIKE CONCAT(\'%\', :name, \'%\')
                       OR name_fr LIKE CONCAT(\'%\', :name, \'%\')
                       OR color_en LIKE CONCAT(\'%\', :name, \'%\')
                       OR color_fr LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                       id,
                       color_en,
                       color_fr,
                       img_player,
                       img_pngXl,
                       img_pngXs,
                       img_svg,
                       name_en,
                       name_fr,
                       player_en,
                       player_fr
                       FROM team
                       WHERE id = :name';
                break;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $number
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function teamAll()
    {
        $query = $this->pdo->prepare(
            'SELECT 
                       id,
                       color_en,
                       color_fr,
                       img_player,
                       img_pngXl,
                       img_pngXs,
                       img_svg,
                       name_en,
                       name_fr,
                       player_en,
                       player_fr
                       FROM team');
        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function type($number)
    {
        //check if lang exist in request
        switch (intval($number)) {
            case '0':
                // is string
                $sql = 'SELECT 
                       id,
                       img,
                       name_en,
                       name_fr
                       FROM type
                       WHERE name_en = :name
                       OR name_fr = :name';
                break;
            default:
                // is number
                $sql = 'SELECT 
                       id,
                       img,
                       name_en,
                       name_fr
                       FROM type
                       WHERE id = :name';
                break;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $number
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function typeAll()
    {
        $query = $this->pdo->prepare(
            'SELECT 
                       id,
                       img,
                       name_en,
                       name_fr
                       FROM type');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function version()
    {
        $query = $this->pdo->prepare(
            'SELECT 
                       version
                       FROM version');

        $query->execute();

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }
}
