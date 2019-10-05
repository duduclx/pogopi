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
            (id, generation, lang, description, name)
            VALUES 
            (:id, :generation, :lang, :description, :name)
            ";

            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $abilitie['id'],
                ':generation' => $abilitie['generation'],
                ':lang' => 'fr',
                ':description' => $abilitie['description_fr'],
                ':name' => $abilitie['name_fr']
            ]);
            $data->execute([
                ':id' => $abilitie['id'],
                ':generation' => $abilitie['generation'],
                ':lang' => 'en',
                ':description' => $abilitie['description_en'],
                ':name' => $abilitie['name_en']
            ]);
        }
    }

    public function insertEvolves($evolves)
    {
        foreach ($evolves as $evolve) {
            $sql = '
            INSERT INTO evolve
            (id, pokemon_id, level, to_id)
            VALUES 
            (:id, :pokemon_id, :level, :to_id)';
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $evolve['id'],
               ':pokemon_id' => $evolve['pokemon_id'],
               ':level' => $evolve['level'],
               ':to_id' => $evolve['to_id']
            ]);

            $sql = '
            UPDATE pokemon 
            SET evolve = :evo
            WHERE pokemon.id = :number';

            $data = $this->db->prepare($sql);
            $data->execute([
                ':evo' => $evolve['id'],
                ':number' => $evolve['pokemon_id']
            ]);
        }
    }

    public function insertFastMoves($fastMoves)
    {
        foreach ($fastMoves as $fastMove) {
            $sql = "
            INSERT INTO fastmove 
            (id, damage, dps, energy, eps, move_duration, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :eps, :move_duration, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $fastMove['id'],
                ':damage' => $fastMove['damage'],
                ':dps' => $fastMove['dps'],
                ':energy' => $fastMove['energy'],
                ':eps' => $fastMove['eps'],
                ':move_duration' => $fastMove['move_duration'],
                ':sound_fx' => $fastMove['sound_fx'],
                ':type' => $fastMove['type']
            ]);

            $sql = "INSERT INTO fastmove_name
            (fastmove_id, lang, name)
            VALUES
            (:fastmove_id, :lang, :name)";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':fastmove_id' => $fastMove['id'],
                ':lang' => 'fr',
                ':name' => $fastMove['name_fr']
            ]);
            $data->execute([
                ':fastmove_id' => $fastMove['id'],
                ':lang' => 'en',
                ':name' => $fastMove['name_en']
            ]);
        }
    }

    public function insertMainMoves($mainMoves)
    {
        foreach ($mainMoves as $mainMove) {
            $sql = "
            INSERT INTO mainmove 
            (id, damage, dps, energy, move_duration, slot, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :move_duration, :slot, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $mainMove['id'],
                ':damage' => $mainMove['damage'],
                ':dps' => $mainMove['dps'],
                ':energy' => $mainMove['energy'],
                ':move_duration' => $mainMove['move_duration'],
                ':slot' => $mainMove['slot'],
                ':sound_fx' => $mainMove['sound_fx'],
                ':type' => $mainMove['type']
            ]);

            $sql = '
            INSERT INTO mainmove_name
            (mainmove_id, lang, name)
            VALUES
            (:mainmove_id, :lang, :name)';
            $data = $this->db->prepare($sql);
            $data->execute([
                ':mainmove_id' => $mainMove['id'],
                ':lang' => 'fr',
                ':name' => $mainMove['name_fr']
            ]);
            $data->execute([
                ':mainmove_id' => $mainMove['id'],
                ':lang' => 'en',
                ':name' => $mainMove['name_en']
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
            (id, attack, attack_spe, base_experience, base_happiness, buddy_walk,
             capture_rate, defense, defense_spe, escape_rate,
             go_attack, go_defense, go_hp, go_pc, go_stamina,
             height, hp, image, `order`, pokedex, scream, speed, weight
            )
            VALUES 
            (:id, :attack, :attack_spe, :base_experience, :base_happiness, :buddy_walk,
             :capture_rate, :defense, :defense_spe, :escape_rate,
             :go_attack, :go_defense, :go_hp, :go_pc, :go_stamina,
             :height, :hp, :image, :order, :pokedex, :scream, :speed, :weight)
            ";
            $data = $this->db->prepare($sql);

            $data->execute([
                ':id' => $pokemon['id'],
                ':attack' => $pokemon['attack'],
                ':attack_spe' => $pokemon['attack_spe'],
                ':base_experience' => $pokemon['base_experience'],
                ':base_happiness' => $pokemon['base_happiness'],
                ':buddy_walk' => $pokemon['buddy_walk'],
                ':capture_rate' => $pokemon['capture_rate'],
                ':defense' => $pokemon['defense'],
                ':defense_spe' => $pokemon['defense_spe'],
                ':escape_rate' => $pokemon['escape_rate'],
                ':go_attack' => $pokemon['go_attack'],
                ':go_defense' => $pokemon['go_defense'],
                ':go_hp' => $pokemon['go_hp'],
                ':go_pc' => $pokemon['go_pc'],
                ':go_stamina' => $pokemon['go_stamina'],
                ':height' => $pokemon['height'],
                ':hp' => $pokemon['hp'],
                ':image' => $pokemon['image'],
                ':order' => $pokemon['order'],
                ':pokedex' => $pokemon['pokedex'],
                ':scream' => $pokemon['scream'],
                ':speed' => $pokemon['speed'],
                ':weight' => $pokemon['weight']
            ]);

            /*
             * pokemon_abilitie
             */
            $sql = "
            INSERT INTO pokemon_abilitie
            (pokemon_id, abilitie_id)
            VALUES
            (:pokemon_id, :abilitie_id)";
            $data = $this->db->prepare($sql);

            if ($pokemon['talent_1'] !== null ) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':abilitie_id' => $pokemon['talent_1']
                ]);
            }
            if ($pokemon['talent_2'] !== null ) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':abilitie_id' => $pokemon['talent_2']
                ]);
            }
            if ($pokemon['talent_3'] !== null ) {
                $data->execute([
                    ':pokemon_id' => $pokemon['id'],
                    ':abilitie_id' => $pokemon['talent_3']
                ]);
            }

            /*
             * pokemon_fast_move
             */
            $sql = "
            INSERT INTO pokemon_fastmove
            (pokemon_id, fastmove_id)
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
            INSERT INTO pokemon_mainmove
            (pokemon_id, mainmove_id)
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
            $sql = '
            INSERT INTO pokemon_name
            (pokemon_id, lang, name)
            VALUES 
            (:pokemon_id, :lang, :name)';
            $data = $this->db->prepare($sql);
            $data->execute([
               ':pokemon_id' => $pokemon['id'],
               ':lang' => 'fr',
               ':name' => $pokemon['name_fr']
            ]);
            $data->execute([
                ':pokemon_id' => $pokemon['id'],
                ':lang' => 'en',
                ':name' => $pokemon['name_en']
            ]);

            /*
             * pokemon_specie
             */
            $sql = '
            INSERT INTO pokemon_specie
            (pokemon_id, lang, specie)
            VALUES
            (:pokemon_id, :lang, :specie)';
            $data = $this->db->prepare($sql);
            $data->execute([
                ':pokemon_id' => $pokemon['id'],
                ':lang' => 'fr',
                ':specie' => $pokemon['specie_fr']
            ]);
            $data->execute([
                ':pokemon_id' => $pokemon['id'],
                ':lang' => 'en',
                ':specie' => $pokemon['specie_en']
            ]);

            /*
             * pokemon_type
             */
            $sql = "
            INSERT INTO pokemon_type
            (pokemon_id, type_id)
            VALUES
            (:pokemon_id, :type_id)";
            $data = $this->db->prepare($sql);
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
                (id, color, emblem_flat_png, emblem_png, emblem_svg, player, image)
                VALUES 
                (:id, :color, :emblem_flat_png, :emblem_png, :emblem_svg, :player, :image)
                ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $team['id'],
                ':color' => $team['color'],
                ':emblem_flat_png' => $team['emblem_flat_png'],
                ':emblem_png' => $team['emblem_png'],
                ':emblem_svg' => $team['emblem_svg'],
                ':player' => $team['player'],
                ':image' => $team['image']
            ]);

            /*
             * team_name
             */
            $sql = "
                INSERT INTO team_name
                (team_id, lang, name)
                VALUES 
                (:team_id, :lang, :name)
                ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':team_id' => $team['id'],
                ':lang' => 'fr',
                ':name' => $team['name_fr']
            ]);
            $data->execute([
                ':team_id' => $team['id'],
                ':lang' => 'en',
                ':name' => $team['name_en']
            ]);
        }
    }

    public function insertTypes($types)
    {
        foreach ($types as $type) {
            $sql = "
            INSERT INTO type 
            (id, img)
            VALUES 
            (:id, :img)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $type['id'],
                ':img' => $type['img']
            ]);

            $sql = '
            INSERT INTO type_name
            (type_id, lang, name)
            VALUES 
            (:type_id, :lang, :name)';
            $data = $this->db->prepare($sql);
            $data->execute([
                ':type_id' => $type['id'],
                ':lang' => 'fr',
                ':name' => $type['name_fr']
            ]);
            $data->execute([
                ':type_id' => $type['id'],
                ':lang' => 'en',
                ':name' => $type['name_en']
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
}
