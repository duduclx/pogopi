<?php


namespace api\Model;

use PDO;

class Fastmove
{
    private $pdo;
    private $sql;

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO("mysql:dbname=$dbname;host=$host;charset=UTF8", $username, $password);
        $this->sql = "
            SELECT 
            fast_move.id,
            fast_move.damage,
            fast_move.dps,
            fast_move.energy,
            fast_move.eps,
            fast_move.move_duration AS duration,
            fast_move.name,
            fast_move.sound_fx AS sound,
            fast_move.type,
            tp.name AS typename,
            tp.img AS typeimg
            FROM fast_move
            LEFT JOIN type AS tp ON type = tp.id";
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResults($result) {
        foreach ($result AS $row) {
            $row['type'] = [
                'id' => $row['type'],
                'name' => $row['typename'],
                'img' => $row['typeimg']
            ];
            unset($row['typename']);
            unset($row['typeimg']);
            $fastmove[] = $row;
        }

        return $fastmove;
    }

    /*
     * api/fastmove/all
     */
    public function fastMoveAll()
    {
        $query = $this->pdo->prepare($this->sql);

        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $fastmove = $this->formatResults($result);

        header('Content-type: application/json');
        echo json_encode($fastmove);
    }

    /*
     * api/fastmove/max
     */
    public function fastMoveMax()
    {
        $sql = 'SELECT 
                COUNT(fast_move.id) AS totalFastMove
                FROM fast_move';

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
     * api/fastmove/id/{id}
     */
    public function fastMoveId($number)
    {
        $sql = $this->sql . ' WHERE fast_move.id = :number';

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
     * api/fastmove/fr/{name}
     */
    public function fastMoveFr($name)
    {
        $sql = $this->sql . ' WHERE fast_move.name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $fastmove = $this->formatResults($result);

        header('Content-type: application/json');
        echo json_encode($fastmove);
    }

    /*
     * api/fastmove/type/{id or name}
     */
    public function fastMoveType($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = $this->sql . ' WHERE tp.name LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = $this->sql . ' WHERE fast_move.type = :name';
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

        $fastmove = $this->formatResults($result);

        header('Content-type: application/json');
        echo json_encode($fastmove);
    }
}
