<?php


namespace api\Model;

use PDO;

class Pokeball
{
    private $pdo;
    private $sql;
    private $urlPokeballImg;

    /*
     * ROUTES
     * api/pokeball/all
     * api/pokeball/max
     * api/pokeball/id/{id}
     * api/pokeball/generation/{id}
     * api/pokeball/name/{name}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        $this->urlPokeballImg = $urlPokeballImg;

        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT 
            pokeball.id,
            pokeball.generation AS gen,
            pokeball.name,
            pokeball.img,
            gn.name
            FROM pokeball
            LEFT JOIN pokedex AS gn ON gn.id = pokeball.generation';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResult($result)
    {
        $result['img'] = $this->urlPokeballImg . $result['img'];
        $result['generation'] = [
            'id' => $result['gen'],
            'name' => $result['name']
        ];
        unset($result['gen']);
        unset($result['name']);

        return $result;
    }

    /*
     * api/pokeball/all
     */
    public function pokeballAll()
    {
        $query = $this->pdo->prepare($this->sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results as $result) {
            $pokeball[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($pokeball, JSON_NUMERIC_CHECK);
    }

    /*
     * api/pokeball/max
     */
    public function pokeballMax()
    {
        $sql = 'SELECT COUNT(id) AS maxPokeball FROM pokeball';

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
     * api/pokeball/id/{id}
     */
    public function pokeballId($number)
    {
        $sql = $this->sql . ' WHERE pokeball.id = :number';

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        $result = $this->formatResult($result);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * api/pokeball/generation/{id}
     */
    public function pokeballGen($number)
    {
        $sql = $this->sql . ' WHERE pokeball.generation = :number';

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
            $pokeball[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($pokeball, JSON_NUMERIC_CHECK);
    }

    /*
     * api/pokeball/name/{name}
     */
    public function pokeballName($name)
    {
        $sql = $this->sql . ' WHERE pokeball.name LIKE CONCAT(\'%\', :number, \'%\')';

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $name
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
}
