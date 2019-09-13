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
                ':lang' => 'fr',
                ':description' => $abilitie['description_fr'],
                ':name' => $abilitie['name_fr']
            ]);
            $data->execute([
                ':id' => $abilitie['id'],
                ':lang' => 'en',
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
            (id, damage, dps, energy, eps, move_duration, name, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :eps, :move_duration, :name, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $fastMove['id'],
                ':damage' => $fastMove['damage'],
                ':dps' => $fastMove['dps'],
                ':energy' => $fastMove['energy'],
                ':eps' => $fastMove['eps'],
                ':move_duration' => $fastMove['move_duration'],
                ':name' => $fastMove['name_fr'],
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
            (id, damage, dps, energy, move_duration, name, slot, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :move_duration, :name, :slot, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $mainMove['id'],
                ':damage' => $mainMove['damage'],
                ':dps' => $mainMove['dps'],
                ':energy' => $mainMove['energy'],
                ':move_duration' => $mainMove['move_duration'],
                ':name' => $mainMove['name_fr'],
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
            (id, attack, defense, height, hp, image, name, `order`, pokedex, scream, weight
            )
            VALUES 
            (:id, :attack, :defense, :height, :hp, :image, :name, :order, :pokedex, :scream, :weight
            )
            ";
            $data = $this->db->prepare($sql);

            $data->execute([
                ':id' => $pokemon['id'],
                ':attack' => $pokemon['attack'],
                ':defense' => $pokemon['defense'],
                ':height' => $pokemon['height'],
                ':hp' => $pokemon['hp'],
                ':image' => $pokemon['image'],
                ':name' => $pokemon['name_fr'],
                ':order' => $pokemon['order'],
                ':pokedex' => $pokemon['pokedex'],
                ':scream' => $pokemon['scream'],
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
                (id, img, png, svg, player)
                VALUES 
                (:id, :img, :png, :svg, :player)
                ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $team['id'],
                ':img' => $team['img_player'],
                ':png' => $team['img_pngXl'],
                ':svg' => $team['img_svg'],
                ':player' => $team['player_en']
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
            (id, img, name)
            VALUES 
            (:id, :img, :name)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $type['id'],
                ':img' => $type['img'],
                ':name' => $type['name_fr']
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
