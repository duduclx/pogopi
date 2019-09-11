<?php


namespace api\Model;

use PDO;

class Pokeball
{
    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT 
            id,
            generation,
            name,
            img
            FROM pokeball';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/pokeball/all
     */
    public function pokeballAll()
    {
        $query = $this->pdo->prepare($this->sql);

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/pokeball/max
     */
    public function pokeballMax()
    {
        $sql = 'SELECT 
               COUNT(id) AS maxPokeball
               FROM pokeball';

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
     * api/pokeball/id/{id}
     */
    public function pokeballId($number)
    {
        $sql = $this->sql . ' WHERE id = :number';

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
     * api/pokeball/generation/{id}
     */
    public function pokeballGen($number)
    {
        $sql = $this->sql . ' WHERE generation = :number';

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/pokeball/name/{name}
     */
    public function pokeballName($number)
    {
        $sql = $this->sql . ' WHERE name LIKE CONCAT(\'%\', :number, \'%\')';

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
}
