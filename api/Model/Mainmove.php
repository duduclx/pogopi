<?php


namespace api\Model;

use PDO;

class Mainmove
{
    // TODO add pokemons owners

    private $pdo;
    private $sql;
    private $urlPokemonAttack;
    private $urlTypeImg;

    /*
     * ROUTES
     * api/mainmove/all
     * api/mainmove/max
     * api/mainmove/id/{id}
     * api/mainmove/name/{intl}/{name}
     * api/mainmove/type/{id or name}
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
        $this->sql = '
            SELECT 
            mainmove.id,
            mainmove.damage,
            mainmove.dps,
            mainmove.energy,
            mainmove.move_duration AS duration,
            mainmove.slot,
            mainmove.sound_fx AS sound,
            mainmove.type AS ti,
            GROUP_CONCAT(DISTINCT mn.lang) AS ml,
            GROUP_CONCAT(CONCAT_WS(\',\', mn.name)) AS mn,
            GROUP_CONCAT(tn.name) AS tn,
            GROUP_CONCAT(tn.lang) AS tl,
            tp.img AS typeimg
            FROM mainmove
            LEFT JOIN mainmove_name AS mn ON mn.mainmove_id = mainmove.id
            LEFT JOIN type AS tp ON mainmove.type = tp.id
            LEFT JOIN type_name AS tn ON tn.type_id = tp.id';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResultAll($result)
    {
        $result['sound'] = $this->urlPokemonAttack . $result['sound'];
        // create name array
        $result['ml'] = explode(',', $result['ml']);
        $result['mn'] = explode(',', $result['mn']);
        for ($i = 0; $i < count($result['ml']); $i++) {
            $result['name'][$result['ml'][$i]] = $result['mn'][$i * (count($result['mn']) / count($result['ml']))];
        }
        unset($result['ml']);
        unset($result['mn']);

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

    private function formatResult($result)
    {
        $result['sound'] = $this->urlPokemonAttack . $result['sound'];
        // create name array
        $result['ml'] = explode(',', $result['ml']);
        $result['mn'] = explode(',', $result['mn']);
        for ($i = 0; $i < count($result['ml']); $i++) {
            $result['name'][$result['ml'][$i]] = $result['mn'][$i];
        }
        unset($result['ml']);
        unset($result['mn']);

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
     * api/mainmove/all
     */
    public function mainMoveAll()
    {
        $sql = $this->sql . ' GROUP BY mainmove.id';
        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results as $result) {
            $mainmove[] = $this->formatResultAll($result);
        }

        header('Content-type: application/json');
        echo json_encode($mainmove, JSON_NUMERIC_CHECK);
    }

    /*
     * api/mainmove/max
     */
    public function mainMoveMax()
    {
        $sql = ' SELECT COUNT(mainmove.id) AS maxMainmove FROM mainmove';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if (empty($result)) {
            $this->error();
            exit;
        }

        header('Content-Type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * api/mainmove/id/{id}
     */
    public function mainMoveId($number)
    {
        $sql = $this->sql . ' WHERE mainmove.id = :number GROUP BY mainmove.id';

        $query = $this->pdo->prepare($sql);

        $query->execute([
            ':number' => $number
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

    /*
     * api/mainmove/name/{intl}/{name}
     */
    public function mainMoveName($intl, $name)
    {
        $sql = 'SELECT mainmove_id FROM mainmove_name
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
            $sql = $this->sql . ' WHERE mainmove.id = :number GROUP BY mainmove.id';

            $query = $this->pdo->prepare($sql);

            $query->execute([
                ':number' => $result['mainmove_id']
            ]);

            $result = $query->fetch(PDO::FETCH_ASSOC);

            $mainmove[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($mainmove, JSON_NUMERIC_CHECK);
    }

    /*
     * api/mainmove/type/{id or name}
     */
    public function mainMoveType($name)
    {
        switch (intval($name)) {
            case '0':
                // is string
                $sql = $this->sql . ' WHERE tn.name LIKE CONCAT(\'%\', :name, \'%\') GROUP BY mainmove.id';
                break;
            default:
                // is number
                $sql = $this->sql . ' WHERE mainmove.type = :name GROUP BY mainmove.id';
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
            $mainmove[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($mainmove, JSON_NUMERIC_CHECK);
    }
}
