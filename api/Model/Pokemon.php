<?php


namespace api\Model;

use PDO;

class Pokemon
{
    private $pdo;
    private $sql;

    // TODO rewrite pokemon/type/{*}/{}

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
            -- pokemon.name,
            pokemon.order,
            pokemon.pokedex,
            pokemon.scream,
            pokemon.weight,
            pokemon.pokedex,
            pkd.name AS pokedex,
            GROUP_CONCAT(DISTINCT pkmn.lang) AS nameslang,
            GROUP_CONCAT(pkmn.name) AS namesname,
            GROUP_CONCAT(DISTINCT type.id) AS typesid,
            GROUP_CONCAT(DISTINCT type.img) AS typesimg,
            GROUP_CONCAT(DISTINCT type.name) AS typesname,
            -- GROUP_CONCAT(DISTINCT abilitie.id) AS abilitiesid,
            -- GROUP_CONCAT(DISTINCT abilitie.name) AS abilitiesname,
            -- GROUP_CONCAT(DISTINCT abilitie.description) AS abilitiesdescription,
            GROUP_CONCAT(DISTINCT fastmove.id) AS fastmovesid,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.damage)) AS fastmovesdamage,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.dps)) AS fastmovesdps,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.energy)) AS fastmovesenergy,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.eps)) AS fastmoveseps,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.move_duration)) AS fastmovesmove,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.name)) AS fastmovesname,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.sound_fx)) AS fastmovessound,
            GROUP_CONCAT(CONCAT_WS(\',\', fastmove.type)) AS fastmovestype,
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
            LEFT JOIN pokemon_name AS pkmn on pokemon.id = pkmn.pokemon_id
            LEFT JOIN pokemon_type AS pktp ON pokemon.id = pktp.pokemon_id
            LEFT JOIN type ON type.id = pktp.type_id
            -- LEFT JOIN pokemon_abilitie AS pkab ON pokemon.id = pkab.pokemon_id
            -- LEFT JOIN abilitie ON abilitie.id = pkab.abilitie_id
            LEFT JOIN pokemon_fast_move AS pkfm ON pokemon.id = pkfm.pokemon_id
            LEFT JOIN fastmove ON fast_move.id = pkfm.fast_move_id
            LEFT JOIN type AS fmtp ON fast_move.type = fmtp.id
            LEFT JOIN pokemon_main_move AS pkmm ON pokemon.id = pkmm.pokemon_id
            LEFT JOIN main_move ON main_move.id = pkmm.main_move_id
            LEFT JOIN type AS mmtp ON main_move.type = mmtp.id';
    }

    public function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function formatResult($result)
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
        /*
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
        */

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

        foreach($results as $result) {
            $result = $this->formatResult($result);
            $pokemon[] = $result;
        }

        header('Content-type: application/json');
        echo json_encode($pokemon);
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
        echo json_encode($result);

    }

    /*
     * api/pokemon/id/{number}
     */
    public function pokemonId($number)
    {
        $sql = $this->sql . ' WHERE pokemon.id = :number
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

        $result = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($result);
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
        echo json_encode($pokemon);
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
        echo json_encode($result);
    }

    /*
     * api/pokemon/name/{name}
     */
    public function pokemonName($name)
    {
        $sql = $this->sql . ' WHERE pokemon.name LIKE CONCAT(\'%\', :name, \'%\') GROUP BY pokemon.id';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
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
        echo json_encode($pokemon);
    }

    /*
     * api/pokemon/type/id/{id}
     */
    public function pokemonTypeId($number)
    {
        $sql = $this->sql . ' GROUP BY pokemon.id';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach($results as $result) {
            $result = $this->formatResult($result);
            // add only if has type
            if (count($result['type']) === 1){
                if ($result['type'][0]['id'] !== $number) {
                    unset($result);
                    continue;
                }
            }
            if (count($result['type']) === 2) {
                if ($result['type'][0]['id'] !== $number && $result['type'][1]['id'] !== $number) {
                    unset($result);
                    continue;
                }
            }

            $pokemon[] = $result;
        }

        header('Content-type: application/json');
        echo json_encode($pokemon);
    }

    /*
     * api/pokemon/type/fr/{id}
     *
     */
    public function pokemonTypeName($number)
    {
        $sql = $this->sql . ' GROUP BY pokemon.id';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach($results as $result) {
            $result = $this->formatResult($result);
            // add only if has type
            if (count($result['type']) === 1){
                if ($result['type'][0]['name'] !== $number) {
                    unset($result);
                    continue;
                }
            }
            if (count($result['type']) === 2) {
                if ($result['type'][0]['name'] !== $number && $result['type'][1]['name'] !== $number) {
                    unset($result);
                    continue;
                }
            }

            $pokemon[] = $result;
        }

        header('Content-type: application/json');
        echo json_encode($pokemon);
    }
}
