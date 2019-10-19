<?php


namespace api\Model;

use PDO;

class Evolve
{
    private $pdo;
    private $sql;

    /*
     * ROUTES
     * api/evolve/all
     * api/evolve/max
     * api/evolve/id/{id}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT 
            evolve.id,
            evolve.pokemon_id,
            evolve.level,
            evolve.to_id
            FROM evolve';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResult($result) {

        // create evolve array
        $result['ids'] = explode(',', $result['ids']);
        $result['levels'] = explode(',', $result['levels']);
        $result['to_ids'] = explode(',', $result['to_ids']);

        for ($i = 0; $i < count($result['ids']); $i++) {
            if ($result['to_ids'][$i] != "0") {
                $result['level'][$result['levels'][$i]]['from'] = $result['ids'][$i];
                $result['level'][$result['levels'][$i]]['to'][] = $result['to_ids'][$i];
            }
        }

        unset($result['ids']);
        unset($result['levels']);
        unset($result['to_ids']);

        return $result;
    }

    /*
     * api/evolve/all
     */
    public function evolveAll()
    {
        $sql = 'SELECT
        evolve.id,
        GROUP_CONCAT(pokemon_id) as ids,
        GROUP_CONCAT(level) as levels,
        GROUP_CONCAT(to_id) as to_ids
        FROM evolve
        GROUP BY evolve.id';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        foreach ($results as $result) {
            $evolves[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($evolves, JSON_NUMERIC_CHECK);
    }

    /*
     * api/evolve/max
     */
    public function evolveMax()
    {
        $sql = 'SELECT GROUP_CONCAT(DISTINCT id) AS maxEvolve FROM evolve GROUP BY id';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if (empty($result)) {
            $this->error();
            exit;
        }

        $result = ['maxEvolve' => count($result)];

        header('Content-Type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * api/evolve/id/{id}
     */
    public function evolveId($number)
    {
        $sql = 'SELECT
        evolve.id,
        GROUP_CONCAT(pokemon_id) as ids,
        GROUP_CONCAT(level) as levels,
        GROUP_CONCAT(to_id) as to_ids
        FROM evolve
        WHERE evolve.id = :number
        GROUP BY evolve.id';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        $result = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }
}
