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
            (id, name_en, name_fr, description_en, description_fr)
            VALUES 
            (:id, :name_en, :name_fr, :description_en, :description_fr)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $abilitie['id'],
                ':name_en' => $abilitie['name_en'],
                ':name_fr' => $abilitie['name_fr'],
                'description_en' => $abilitie['description_en'],
                'description_fr' => $abilitie['description_fr']

            ]);
        }
    }

    public function insertFastMoves($fastMoves)
    {
        foreach ($fastMoves as $fastMove) {
            $sql = "
            INSERT INTO fast_move 
            (id, damage, dps, energy, eps, move_duration, name_en, name_fr, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :eps, :move_duration, :name_en, :name_fr, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $fastMove['id'],
                ':damage' => $fastMove['damage'],
                ':dps' => $fastMove['dps'],
                ':energy' => $fastMove['energy'],
                ':eps' => $fastMove['eps'],
                ':move_duration' => $fastMove['move_duration'],
                ':name_en' => $fastMove['name_en'],
                ':name_fr' => $fastMove['name_fr'],
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
            (id, damage, dps, energy, move_duration, name_en, name_fr, slot, sound_fx, type)
            VALUES 
            (:id, :damage, :dps, :energy, :move_duration, :name_en, :name_fr, :slot, :sound_fx, :type)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $mainMove['id'],
                ':damage' => $mainMove['damage'],
                ':dps' => $mainMove['dps'],
                ':energy' => $mainMove['energy'],
                ':move_duration' => $mainMove['move_duration'],
                ':name_en' => $mainMove['name_en'],
                ':name_fr' => $mainMove['name_fr'],
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
            (id, attack, attack_max, attack_spe, base_experience, base_happiness, buddy_walk,
             capture_rate, defense, defense_max, defense_spe, escape_rate, height,
             image, name_en, name_fr, `order`, pc_max, pv, pv_max, scream, specie_en, specie_fr,
             speed, stamina_max, weight,
             abilitie_1, abilitie_2, abilitie_3, fast_move_1, fast_move_2, fast_move_3,
             main_move_1, main_move_2, main_move_3, main_move_4, pokedex, type_1, type_2)
            VALUES 
            (:id, :attack, :attack_max, :attack_spe, :base_experience, :base_happiness, :buddy_walk,
             :capture_rate, :defense, :defense_max, :defense_spe, :escape_rate, :height,
             :image, :name_en, :name_fr, :order, :pc_max, :pv, :pv_max, :scream, :specie_en, :specie_fr,
             :speed, :stamina_max, :weight,
             :abilitie_1, :abilitie_2, :abilitie_3, :fast_move_1, :fast_move_2, :fast_move_3,
             :main_move_1, :main_move_2, :main_move_3, :main_move_4, :pokedex, :type_1, :type_2)
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
                ':image' => $pokemon['image'],
                ':name_en' => $pokemon['name_en'],
                ':name_fr' => $pokemon['name_fr'],
                ':order' => $pokemon['order'],
                ':pc_max' => $pokemon['pc_max'],
                ':pv' => $pokemon['pv'],
                ':pv_max' => $pokemon['pv_max'],
                ':scream' => $pokemon['scream'],
                ':specie_en' => $pokemon['specie_en'],
                ':specie_fr' => $pokemon['specie_fr'],
                ':speed' => $pokemon['speed'],
                ':stamina_max' => $pokemon['stamina_max'],
                ':weight' => $pokemon['weight'],
                ':abilitie_1' => $pokemon['abilitie_1'],
                ':abilitie_2' => $pokemon['abilitie_2'],
                ':abilitie_3' => $pokemon['abilitie_3'],
                ':fast_move_1' => $pokemon['fast_move_1'],
                ':fast_move_2' => $pokemon['fast_move_2'],
                ':fast_move_3' => $pokemon['fast_move_3'],
                ':main_move_1' => $pokemon['main_move_1'],
                ':main_move_2' => $pokemon['main_move_2'],
                ':main_move_3' => $pokemon['main_move_3'],
                ':main_move_4' => $pokemon['main_move_4'],
                ':pokedex' => $pokemon['pokedex'],
                ':type_1' => $pokemon['type_1'],
                ':type_2' => $pokemon['type_2']
            ]);
        }

    }

    public function insertTeam($teams)
    {
        foreach ($teams as $team) {
            $sql = "
            INSERT INTO team
            (id, color_en, color_fr, img_player, img_pngXl, img_pngXs, img_svg,
             name_en, name_fr, player_en, player_fr)
            VALUES 
            (:id, :color_en, :color_fr, :img_player, :img_pngXl, :img_pngXs, :img_svg,
             :name_en, :name_fr, :player_en, :player_fr)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $team['id'],
                ':color_en' => $team['color_en'],
                ':color_fr' => $team['color_fr'],
                ':img_player' => $team['img_player'],
                ':img_pngXl' => $team['img_pngXl'],
                ':img_pngXs' => $team['img_pngXs'],
                ':img_svg' => $team['img_svg'],
                ':name_en' => $team['name_en'],
                ':name_fr' => $team['name_fr'],
                ':player_en' => $team['player_en'],
                ':player_fr' => $team['player_fr']
            ]);
        }

    }

    public function insertTypes($types)
    {
        foreach ($types as $type) {
            $sql = "
            INSERT INTO type 
            (id, img, name_en, name_fr)
            VALUES 
            (:id, :img, :name_en, :name_fr)
            ";
            $data = $this->db->prepare($sql);
            $data->execute([
                ':id' => $type['id'],
                ':img' => $type['img'],
                ':name_en' => $type['name_en'],
                ':name_fr' => $type['name_fr']
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