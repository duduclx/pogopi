<?php


namespace api\Model;

use PDO;

class Fastmove
{
    private $pdo;
    private $sql;
    private $urlPokemonAttack;
    private $urlTypeImg;

    /*
     * ROUTES
     * api/fastmove/all
     * api/fastmove/max
     * api/fastmove/id/{id}
     * api/fastmove/name/{intl}/{name}
     * api/fastmove/type/{id-name}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        $this->urlPokemonAttack = $urlPokemonAttack;
        $this->urlTypeImg = $urlTypeImg;

        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = "
            SELECT 
            fastmove.id,
            fastmove.damage,
            fastmove.dps,
            fastmove.energy,
            fastmove.eps,
            fastmove.move_duration AS duration,
            fastmove.sound_fx AS sound,
            fastmove.type AS ti,
            GROUP_CONCAT(DISTINCT fn.lang) AS fl,
            GROUP_CONCAT(DISTINCT fn.name) AS fn,
            GROUP_CONCAT(tn.name) AS tn,
            GROUP_CONCAT(tn.lang) AS tl,
            tp.img AS typeimg
            FROM fastmove
            LEFT JOIN fastmove_name as fn ON fn.fastmove_id = fastmove.id
            LEFT JOIN type AS tp ON tp.id = fastmove.type
            LEFT JOIN type_name AS tn ON tn.type_id = tp.id";
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResult($result) {

        $result['sound'] = $this->urlPokemonAttack . $result['sound'];
        // create name array
        $result['fl'] = explode(',', $result['fl']);
        $result['fn'] = explode(',', $result['fn']);
        for ($i = 0; $i < count($result['fl']); $i++) {
            $result['name'][$result['fl'][$i]] = $result['fn'][$i];
        }
        unset($result['fl']);
        unset($result['fn']);

        // create type array
        $result['type']['id'] = $result['ti'];
        $result['type']['img'] = $this->urlTypeImg . $result['typeimg'];
        $result['tl'] = explode(',',$result['tl']);
        $result['tn'] = explode(',',$result['tn']);
        for ($i = 0; $i < count($result['tl']); $i++){
            $result['type']['name'][$result['tl'][$i]] = $result['tn'][$i];
        }
        unset($result['ti']);
        unset($result['tl']);
        unset($result['tn']);
        unset($result['typeimg']);

        return $result;
    }

    /*
     * api/fastmove/all
     */
    public function fastMoveAll()
    {
        $sql = $this->sql . ' GROUP BY fastmove.id';
        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results AS $result) {
            $fastmove[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($fastmove, JSON_NUMERIC_CHECK);
    }

    /*
     * api/fastmove/max
     */
    public function fastMoveMax()
    {
        $sql = 'SELECT COUNT(fastmove.id) AS maxFastmove FROM fastmove';

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
     * api/fastmove/id/{id}
     */
    public function fastMoveId($number)
    {
        $sql = $this->sql . ' WHERE fastmove.id = :number GROUP BY fastmove.id';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $fastmove = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($fastmove, JSON_NUMERIC_CHECK);
    }

    /*
     * api/fastmove/name/{intl}/{name}
     */
    public function fastMoveName($intl,$name)
    {
        $sql = 'SELECT fastmove_id FROM fastmove_name
        WHERE lang = :intl
        AND name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':intl' => $intl,
            ':name' => $name
        ]);

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results as $result) {
            $sql = $this->sql . ' WHERE fastmove.id = :number GROUP BY fastmove.id';

            $query = $this->pdo->prepare($sql);
            $query->execute([
                ':number' => $result['fastmove_id']
            ]);

            $result = $query->fetch(PDO::FETCH_ASSOC);

            $fastmove[] = $this->formatResult($result);
        }
        header('Content-type: application/json');
        echo json_encode($fastmove, JSON_NUMERIC_CHECK);
    }

    /*
     * api/fastmove/type/{id or name}
     */
    public function fastMoveType($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = $this->sql . ' WHERE tn.name LIKE CONCAT(\'%\', :name, \'%\') GROUP BY fastmove.id';
                break;
            default:
                // is number
                $sql = $this->sql . ' WHERE fastmove.type = :name GROUP BY fastmove.id';
                break;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $name
        ]);

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results as $result) {
            $fastmove[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($fastmove, JSON_NUMERIC_CHECK);
    }
}
