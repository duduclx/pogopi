<?php


namespace api\Model;

use PDO;

class Mainmove
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
            main_move.id,
            main_move.damage,
            main_move.dps,
            main_move.energy,
            main_move.move_duration AS duration,
            main_move.name,
            main_move.slot,
            main_move.sound_fx AS sound,
            main_move.type,
            tp.name AS typename,
            tp.img AS typeimg
            FROM main_move
            LEFT JOIN type AS tp ON main_move.type = tp.id';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    public function formatResult($results)
    {
        foreach ($results AS $row) {
            $row['type'] = [
                'id' => $row['type'],
                'name' => $row['typename'],
                'img' => $row['typeimg']
            ];
            unset($row['typename']);
            unset($row['typeimg']);
            $mainmove[] = $row;
        }
        return $mainmove;
    }

    /*
     * api/mainmove/all
     */
    public function mainMoveAll()
    {
        $query = $this->pdo->prepare($this->sql);
        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $mainmove = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($mainmove);
    }

    /*
     * api/mainmove/max
     */
    public function mainMoveMax()
    {
        $sql = ' SELECT COUNT(main_move.id) AS totalMainMove FROM main_move';

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
     * api/mainmove/id/{id}
     */
    public function mainMoveId($number)
    {
        $sql = $this->sql . ' WHERE main_move.id = :number';

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $result['type'] = [
            'id' => $result['type'],
            'name' => $result['typename'],
            'img' => $result['typeimg']
        ];
        unset($result['typename']);
        unset($result['typeimg']);

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/mainmove/fr/{name}
     */
    public function mainMoveFr($name)
    {
        $sql = $this->sql . ' WHERE main_move.name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $mainmove = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($mainmove);
    }

    /*
     * api/mainmove/type/{id or name}
     */
    public function mainMoveType($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = $this->sql . ' WHERE tp.name LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = $this->sql . ' WHERE main_move.type = :name';
                break;
        }

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $mainmove = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($mainmove);
    }
}
