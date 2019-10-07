<?php


namespace api\Model;

use PDO;

class Abilitie
{
    private $pdo;
    private $sql;

    /*
     * ROUTES
     * api/abilitie/all
     * api/abilitie/max
     * api/abilitie/id/{id}
     * api/abilitie/name/{intl}/{name}
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
            id,
            generation,
            GROUP_CONCAT(lang) AS langs,
            GROUP_CONCAT(description) AS descriptions,
            GROUP_CONCAT(name) AS names
            FROM abilitie';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResult($results) {
        foreach ($results as $result) {
            $result['langs'] = explode(',',$result['langs']);
            $result['descriptions'] = explode(',',$result['descriptions']);
            $result['names'] = explode(',',$result['names']);
            for ($i=0; $i < count($result['langs']); $i++) {
                $abilitie['id'] = $result['id'];
                $abilitie['generation'] = $result['generation'];
                $abilitie['description'][$result['langs'][$i]] = $result['descriptions'][$i];
                $abilitie['name'][$result['langs'][$i]] = $result['names'][$i];
            }
            $abilities[] = $abilitie;
        }
        return $abilities;
    }

    /*
     * api/abilitie/all
     */
    public function abilitieAll()
    {
        $sql = $this->sql . ' GROUP BY id, generation';
        $query = $this->pdo->prepare($sql);

        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        $abilities = $this->formatResult($results);

        header('Content-type: application/json');
        echo json_encode($abilities, JSON_NUMERIC_CHECK);
    }

    /*
     * api/abilitie/max
     */
    public function abilitieMax()
    {
        $sql = 'SELECT GROUP_CONCAT(DISTINCT id) AS maxAbilitie FROM abilitie GROUP BY id';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if (empty($result)) {
            $this->error();
            exit;
        }

        $result = ['maxAbilitie' => count($result)];

        header('Content-Type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * api/abilitie/id/{id}
     */
    public function abilitieId($number)
    {
        $sql = $this->sql . ' WHERE id = :number GROUP BY id, generation';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        $abilities = $this->formatResult($results);

        header('Content-type: application/json');
        echo json_encode($abilities, JSON_NUMERIC_CHECK);
    }

    /*
     * api/abilitie/name/{intl}/{name}
     */
    public function abilitieName($intl, $name)
    {
        $sql = 'SELECT 
                id,
                generation,
                description,
                name
                FROM abilitie
                WHERE name LIKE CONCAT(\'%\', :name, \'%\')
                AND lang = :intl';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':intl' => $intl,
            ':name' => $name
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }
}
