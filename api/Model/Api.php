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
                        description_en,
                        description_fr,
                        name_en,
                        name_fr
                        FROM abilitie
                        WHERE name_en LIKE CONCAT(\'%\', :name, \'%\')
                        OR name_fr LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                        id,
                        description_en,
                        description_fr,
                        name_en,
                        name_fr
                        FROM abilitie
                        WHERE id = :name';
                break;
        }
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

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
                        description_en,
                        description_fr,
                        name_en,
                        name_fr
                        FROM abilitie');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function fastMove($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = 'SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        eps,
                        move_duration,
                        name_en,
                        name_fr,
                        sound_fx,
                        type
                        FROM fast_move
                        WHERE name_en LIKE CONCAT(\'%\', :name, \'%\')
                        OR name_fr LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        eps,
                        move_duration,
                        name_en,
                        name_fr,
                        sound_fx,
                        type
                        FROM fast_move
                        WHERE id = :name';
                break;
        }
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function fastMoveAll()
    {
        $query = $this->pdo->prepare('
                        SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        eps,
                        move_duration,
                        name_en,
                        name_fr,
                        sound_fx,
                        type
                        FROM fast_move');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function generation($name)
    {

        switch (intval($name)) {
            case '0':
                // is string
                $sql = 'SELECT id, name FROM pokedex
                        WHERE name = :name';
                break;
            default:
                // is number
                $sql = 'SELECT id, name FROM pokedex
                        WHERE id = :name';
                break;
        }
        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function generationAll()
    {
        $query = $this->pdo->prepare('
        SELECT id, name FROM pokedex');

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
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
                        name_en,
                        name_fr,
                        slot,
                        sound_fx,
                        type
                        FROM main_move
                        WHERE name_en LIKE CONCAT(\'%\', :name, \'%\')
                        OR name_fr LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT 
                        id,
                        damage,
                        dps,
                        energy,
                        move_duration,
                        name_en,
                        name_fr,
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

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

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
                        name_en,
                        name_fr,
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

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

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
     *
     */
    public function pokemon($name, $number)
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
                    fm1.type AS fast_move_1_type,
                    fm1type.img AS fast_move_1_img,
                    pokemon.fast_move_2,
                    fm2.damage AS fast_move_2_damage,
                    fm2.dps AS fast_move_2_dps,
                    fm2.energy AS fast_move_2_energy,
                    fm2.eps AS fast_move_2_eps,
                    fm2.move_duration AS fast_move_2_move_duration,
                    fm2.name_en AS fast_move_2_name_en,
                    fm2.name_fr AS fast_move_2_name_fr,
                    fm2.sound_fx AS fast_move_2_sound_fx,
                    fm2.type AS fast_move_2_type,
                    fm2type.img AS fast_move_2_img,
                    pokemon.fast_move_3,
                    fm3.damage AS fast_move_3_damage,
                    fm3.dps AS fast_move_3_dps,
                    fm3.energy AS fast_move_3_energy,
                    fm3.eps AS fast_move_3_eps,
                    fm3.move_duration AS fast_move_3_move_duration,
                    fm3.name_en AS fast_move_3_name_en,
                    fm3.name_fr AS fast_move_3_name_fr,
                    fm3.sound_fx AS fast_move_3_sound_fx,
                    fm3.type AS fast_move_3_type,
                    fm3type.img AS fast_move_3_img,
                    pokemon.main_move_1,
                    mm1.damage AS main_move_1_damage,
                    mm1.dps AS main_move_1_dps,
                    mm1.energy AS main_move_1_energy,
                    mm1.move_duration AS main_move_1_move_duration,
                    mm1.name_en AS main_move_1_name_en,
                    mm1.name_fr AS main_move_1_name_fr,
                    mm1.slot AS main_move_1_slot,
                    mm1.sound_fx AS main_move_1_sound_fx,
                    mm1.type AS main_move_1_type,
                    mm1type.img AS main_move_1_img,
                    pokemon.main_move_2,
                    mm2.damage AS main_move_2_damage,
                    mm2.dps AS main_move_2_dps,
                    mm2.energy AS main_move_2_energy,
                    mm2.move_duration AS main_move_2_move_duration,
                    mm2.name_en AS main_move_2_name_en,
                    mm2.name_fr AS main_move_2_name_fr,
                    mm2.slot AS main_move_2_slot,
                    mm2.sound_fx AS main_move_2_sound_fx,
                    mm2.type AS main_move_2_type,
                    mm2type.img AS main_move_2_img,
                    pokemon.main_move_3,
                    mm3.damage AS main_move_3_damage,
                    mm3.dps AS main_move_3_dps,
                    mm3.energy AS main_move_3_energy,
                    mm3.move_duration AS main_move_3_move_duration,
                    mm3.name_en AS main_move_3_name_en,
                    mm3.name_fr AS main_move_3_name_fr,
                    mm3.slot AS main_move_3_slot,
                    mm3.sound_fx AS main_move_3_sound_fx,
                    mm3.type AS main_move_3_type,
                    mm3type.img AS main_move_3_img,
                    pokemon.main_move_4,
                    mm4.damage AS main_move_4_damage,
                    mm4.dps AS main_move_4_dps,
                    mm4.energy AS main_move_4_energy,
                    mm4.move_duration AS main_move_4_move_duration,
                    mm4.name_en AS main_move_4_name_en,
                    mm4.name_fr AS main_move_4_name_fr,
                    mm4.slot AS main_move_4_slot,
                    mm4.sound_fx AS main_move_4_sound_fx,
                    mm4.type AS main_move_4_type,
                    mm4type.img AS main_move_4_img,
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
                    LEFT JOIN type AS fm1type ON fm1.type = fm1type.id
                    LEFT JOIN type AS fm2type ON fm2.type = fm2type.id
                    LEFT JOIN type AS fm3type ON fm3.type = fm3type.id
                    LEFT JOIN type AS mm1type ON mm1.type = mm1type.id
                    LEFT JOIN type AS mm2type ON mm2.type = mm2type.id
                    LEFT JOIN type AS mm3type ON mm3.type = mm3type.id
                    LEFT JOIN type AS mm4type ON mm4.type = mm4type.id
                    ';
        switch ($name) {
            case 'generation':
            case 'pokedex':
                $sql = "$base_sql WHERE pokemon.pokedex = :number";
                break;
            case 'id':
                $sql = "$base_sql WHERE pokemon.id = :number";
                break;
            case 'order':
                $sql = "$base_sql WHERE pokemon.order = :number";
                break;
            case 'en':
                $sql = "$base_sql WHERE pokemon.name_en LIKE CONCAT('%', :number, '%')";
                break;
            case 'fr':
                $sql = "$base_sql WHERE pokemon.name_fr LIKE CONCAT('%', :number, '%')";
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

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $result['error'] = 400;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

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