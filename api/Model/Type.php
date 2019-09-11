<?php


namespace api\Model;

use PDO;

class Type
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
        $this->sql = '
            SELECT 
            id,
            img,
            name
            FROM type';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/type/all
     */
    public function typeAll()
    {
        $query = $this->pdo->prepare('
            SELECT 
            id,
            img,
            name
            FROM type');
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
     * api/type/max
     */
    public function typeMax()
    {
        $sql = 'SELECT COUNT(id) AS maxType FROM type';
        $query = $this->pdo->prepare($sql);
        $query->execute();

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if (empty($result)) {
            $this->error();
            exit;
        }

        header('Content-Type: application/json');
        echo json_encode($result);
    }

    /*
     * type/{id-name}
     * TODO intl
     */
    public function typeId($number)
    {
        //check if lang exist in request
        switch (intval($number)) {
            case '0':
                // is string
                $sql = $this->sql . ' WHERE name = :name';
                break;
            default:
                // is number
                $sql = $this->sql . ' WHERE id = :name';
                break;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $number
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }
}
