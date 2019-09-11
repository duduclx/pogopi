<?php


namespace api\Model;

use PDO;

class Abilitie
{
    private $pdo;

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO("mysql:dbname=$dbname;host=$host;charset=UTF8", $username, $password);
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/abilitie/all
     */
    public function abilitieAll()
    {
        $query = $this->pdo->prepare('
                        SELECT 
                        id,
                        GROUP_CONCAT(lang) AS langs,
                        GROUP_CONCAT(description) AS descriptions,
                        GROUP_CONCAT(name) AS names
                        FROM abilitie
                        GROUP BY id');

        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results as $result) {
            $result['langs'] = explode(',',$result['langs']);
            $result['descriptions'] = explode(',',$result['descriptions']);
            $result['names'] = explode(',',$result['names']);
            for ($i=0; $i < count($result['langs']); $i++) {
                $abilitie['id'] = $result['id'];
                $abilitie['description'][$result['langs'][$i]] = $result['descriptions'][$i];
                $abilitie['name'][$result['langs'][$i]] = $result['names'][$i];
            }
            $abilities[] = $abilitie;
        }

        header('Content-type: application/json');
        echo json_encode($abilities);
    }

    /*
     * api/abilitie/max
     */
    public function abilitieMax()
    {
        $sql = 'SELECT count(id) AS maxAbilitie FROM abilitie';

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
     * api/abilitie/id/{id}
     */
    public function abilitieId($number)
    {
        $sql = 'SELECT 
                id,
                GROUP_CONCAT(lang) AS langs,
                GROUP_CONCAT(description) AS descriptions,
                GROUP_CONCAT(name) AS names
                FROM abilitie
                WHERE id = :number';

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
            $result['langs'] = explode(',',$result['langs']);
            $result['descriptions'] = explode(',',$result['descriptions']);
            $result['names'] = explode(',',$result['names']);
            for ($i=0; $i < count($result['langs']); $i++) {
                $abilitie['id'] = $result['id'];
                $abilitie['description'][$result['langs'][$i]] = $result['descriptions'][$i];
                $abilitie['name'][$result['langs'][$i]] = $result['names'][$i];
            }
            $abilities[] = $abilitie;
        }

        header('Content-type: application/json');
        echo json_encode($abilities);
    }

    /*
     * api/{intl}/abilitie/{name}
     */
    public function abilitieName($intl, $name)
    {
        $sql = 'SELECT 
                id,
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
        echo json_encode($result);
    }
}
