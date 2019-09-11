<?php


namespace api\Model;

use PDO;

class Generation
{
    private $pdo;
    private $sql;

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = 'SELECT id, name FROM pokedex';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/generation/all
     */
    public function generationAll()
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
     * api/generation/max
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

    /*
     * api/generation/Name/{name}
     */
    public function generationName($name)
    {
        $sql = $this->sql . ' WHERE name LIKE CONCAT(\'%\', :name, \'%\')';
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
     * api/generation/id/{id}
     */
    public function generationId($number)
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
}
