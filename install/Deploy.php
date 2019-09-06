<?php


class Deploy
{
    private $db;

    public function __construct($host, $dbname, $username, $password)
    {
        $this->db = new PDO("mysql:dbname=$dbname;host=$host;charset=UTF8", $username, $password);
    }

    public function insertAbilities($abilities)
    {
        foreach ($abilities as $abilitie) {
            $sql = "
            INSERT INTO abilitie 
            (id, lang, description, name)
            VALUES 
            (:id, :lang, :description, :name)
            ";

            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $abilitie['id'],
                ':lang' => 'FR',
                ':description' => $abilitie['description_fr'],
                ':name' => $abilitie['name_fr']
            ]);

            $data->execute([
                ':id' => $abilitie['id'],
                ':lang' => 'EN',
                ':description' => $abilitie['description_en'],
                ':name' => $abilitie['name_en']
            ]);
        }
    }

    public function insertFastMoves($fastMoves)
    {
        foreach ($fastMoves as $fastMove) {
            $sql = "
            INSERT INTO fast_move 
            (id, damage, dps, energy, eps, move_duration, names, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :eps, :move_duration, :names, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $fastMove['id'],
                ':damage' => $fastMove['damage'],
                ':dps' => $fastMove['dps'],
                ':energy' => $fastMove['energy'],
                ':eps' => $fastMove['eps'],
                ':move_duration' => $fastMove['move_duration'],
                ':names' => "{ en: " . $fastMove['name_en'] . ", fr: " . $fastMove['name_fr'] . " }",
                ':sound_fx' => $fastMove['sound_fx'],
                ':type' => $fastMove['type']
            ]);
        }
    }


    public function insertMainMoves($mainMoves)
    {
        foreach ($mainMoves as $mainMove) {
            $sql = "
            INSERT INTO main_move 
            (id, damage, dps, energy, move_duration, names, slot, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :move_duration, :names, :slot, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $mainMove['id'],
                ':damage' => $mainMove['damage'],
                ':dps' => $mainMove['dps'],
                ':energy' => $mainMove['energy'],
                ':move_duration' => $mainMove['move_duration'],
                ':names' => "{ en: " . $mainMove['name_en'] . ", fr: " . $mainMove['name_fr'] . " }",
                ':slot' => $mainMove['slot'],
                ':sound_fx' => $mainMove['sound_fx'],
                ':type' => $mainMove['type']
            ]);
        }
    }

    public function insertPokeballs($pokeballs)
    {
        foreach ($pokeballs as $pokeball) {
            $sql = "
            INSERT INTO pokeball 
            (id, generation, name, img)
            VALUES 
            (:id, :generation, :name, :img)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $pokeball['id'],
                ':generation' => $pokeball['generation'],
                ':name' => $pokeball['name'],
                ':img' => $pokeball['img']
            ]);
        }
    }

    public function insertPokedex($pokedexes)
    {
        foreach ($pokedexes as $pokedex) {
            $sql = "
            INSERT INTO pokedex 
            (id, name)
            VALUES 
            (:id, :name)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $pokedex['id'],
                ':name' => $pokedex['name']
            ]);
        }
    }

    public function insertPokemons($pokemons)
    {
        foreach ($pokemons as $pokemon) {
            $sql = "
            INSERT INTO pokemon 
            (id, attack, attack_max, attack_spe, base_experience, base_happiness, 
             buddy_walk, capture_rate, defense, defense_max, defense_spe, escape_rate, 
             height, hp, hp_max, image, `order`, pc_max, pokedex, 
             scream, speed, stamina_max, weight
            )
            VALUES 
            (:id, :attack, :attack_max, :attack_spe, :base_experience, :base_happiness, 
             :buddy_walk, :capture_rate, :defense, :defense_max, :defense_spe, :escape_rate, 
             :height, :hp, :hp_max, :image, :order, :pc_max, :pokedex,
             :scream, :speed, :stamina_max, :weight
            )
            ";
            $data = $this->db->prepare($sql);

            $data->execute([
                ':id' => $pokemon['id'],
                ':attack' => $pokemon['attack'],
                ':attack_max' => $pokemon['attack_max'],
                ':attack_spe' => $pokemon['attack_spe'],
                ':base_experience' => $pokemon['base_experience'],
                ':base_happiness' => $pokemon['base_happiness'],
                ':buddy_walk' => $pokemon['buddy_walk'],
                ':capture_rate' => $pokemon['capture_rate'],
                ':defense' => $pokemon['defense'],
                ':defense_max' => $pokemon['defense_max'],
                ':defense_spe' => $pokemon['defense_spe'],
                ':escape_rate' => $pokemon['escape_rate'],
                ':height' => $pokemon['height'],
                ':hp' => $pokemon['hp'],
                ':hp_max' => $pokemon['hp_max'],
                ':image' => $pokemon['image'],
                ':names' => "{ en: " . $pokemon['name_en'] . ", fr: " . $pokemon['name_fr'] . " }",
                ':order' => $pokemon['order'],
                ':pc_max' => $pokemon['pc_max'],
                ':pokedex' => $pokemon['pokedex'],
                ':scream' => $pokemon['scream'],
                ':species' => "{ en: " . $pokemon['specie_en'] . ", fr: " . $pokemon['specie_fr'] . " }",
                ':speed' => $pokemon['speed'],
                ':stamina_max' => $pokemon['stamina_max'],
                ':weight' => $pokemon['weight']
            ]);

            /*
             * pokemon_abilitie
             */
            $sql = "
            INSERT INTO pokemon_abilitie
            (pokemon_id, abilitie_id)
            VALUES
            (:pokemon_id, :abiltie_id)";
            $data = $this->db->prepare($sql);

            if ($pokemon['abilitie_1'] !== null ) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':abilitie_id' => $pokemon['abilitie_1']
                ]);
            }
            if ($pokemon['abilitie_2'] !== null ) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':abilitie_id' => $pokemon['abilitie_2']
                ]);
            }
            if ($pokemon['abilitie_3'] !== null ) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':abilitie_id' => $pokemon['abilitie_3']
                ]);
            }

            /*
             * pokemon_fast_move
             */
            $sql = "
            INSERT INTO pokemon_fast_move
            (pokemon_id, fast_move_id)
            VALUES
            (:pokemon_id, :fast_move_id)";
            $data = $this->db->prepare($sql);

            if ($pokemon['fast_move_1'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':fast_move_id' => $pokemon['fast_move_1']
                ]);
            }
            if ($pokemon['fast_move_2'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':fast_move_id' => $pokemon['fast_move_2']
                ]);
            }
            if ($pokemon['fast_move_3'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':fast_move_id' => $pokemon['fast_move_3']
                ]);
            }

            /*
             * pokemon_main_move
             */
            $sql = "
            INSERT INTO pokemon_main_move
            (pokemon_id, main_move_id)
            VALUES
            (:pokemon_id, :main_move_id)";
            $data = $this->db->prepare($sql);

            if ($pokemon['main_move_1'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':main_move_id' => $pokemon['main_move_1']
                ]);
            }
            if ($pokemon['main_move_2'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':main_move_id' => $pokemon['main_move_2']
                ]);
            }
            if ($pokemon['main_move_3'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':main_move_id' => $pokemon['main_move_3']
                ]);
            }
            if ($pokemon['main_move_4'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':main_move_id' => $pokemon['main_move_4']
                ]);
            }

            /*
             * pokemon_name
             */

            /*
             * pokemon_specie
             */

            /*
             * pokemon_type
             */
            $sql = "
            INSERT INTO pokemon_type
            (pokemon_id, type_id)
            VALUES
            (:pokemon_id, :type_id)";
            $data = $this->db->prepare($sql);
            $types = [];
            if ($pokemon['type_1'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':type_id' => $pokemon['type_1']
                ]);
            }
            if ($pokemon['type_2'] !== null) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':type_id' => $pokemon['type_2']
                ]);
            }
        }

    }

    public function insertTeam($teams)
    {
        foreach ($teams as $team) {
            $sql = "
            INSERT INTO team
            (id, colors, img_player, img_pngXl, img_pngXs, img_svg,
             names, players)
            VALUES 
            (:id, :colors, :img_player, :img_pngXl, :img_pngXs, :img_svg,
             :names, :players)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $team['id'],
                ':colors' => "[ en: " . $team['color_en'] . ", fr: " . $team['color_fr'] . " ]",
                ':img_player' => $team['img_player'],
                ':img_pngXl' => $team['img_pngXl'],
                ':img_pngXs' => $team['img_pngXs'],
                ':img_svg' => $team['img_svg'],
                ':names' => "[ en: " . $team['name_en'] . ", fr: " . $team['name_fr'] . " ]",
                ':players' => "[ en: " . $team['player_en'] . ", fr: " . $team['player_fr'] . " ]"
            ]);
        }

    }

    public function insertTypes($types)
    {
        foreach ($types as $type) {
            $sql = "
            INSERT INTO type 
            (id, img, names)
            VALUES 
            (:id, :img, :names)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $type['id'],
                ':img' => $type['img'],
                ':names' => "[ en: " . $type['name_en'] . ', fr: ' . $type['name_fr'] . " ]"
            ]);
        }
    }

    public function version($version)
    {
        $sql = "
            INSERT INTO version 
            (version)
            VALUES 
            (:version)
            ";
        $data = $this->db->prepare($sql);
        $data->execute([
            ':version' => $version
        ]);
    }

    public function successMessage()
    {

    }
}
