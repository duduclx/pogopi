<?php


namespace api\Model;

use PDO;

class Type
{
    private $pdo;
    private $sql;
    private $urlTypeImg;

    /*
     * ROUTES
     * api/type/all
     * api/type/max
     * api/type/id/{id}
     * api/type/name/{intl}/{name}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        $this->urlTypeImg = $urlTypeImg;

        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT 
            type.id,
            type.img,
            GROUP_CONCAT(tn.lang) AS langs,
            GROUP_CONCAT(tn.name) AS names
            FROM type
            LEFT JOIN type_name AS tn ON type.id = tn.type_id
            ';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    private function formatResult($result)
    {
        $result['img'] = $this->urlTypeImg . $result['img'];

        $result['langs'] = explode(',',$result['langs']);
        $result['names'] = explode(',',$result['names']);
        for ($i = 0; $i < count($result['langs']); $i++){
            $result['name'][$result['langs'][$i]] = $result['names'][$i];
        }
        unset($result['langs']);
        unset($result['names']);

        return $result;
    }

    /*
     * api/type/all
     */
    public function typeAll()
    {
        $sql = $this->sql . ' GROUP BY type.id';
        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach ($results as $result) {
            $types[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($types, JSON_NUMERIC_CHECK);
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
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * type/id/{id}
     */
    public function typeId($number)
    {
        $sql = $this->sql . ' WHERE type.id = :number GROUP BY type.id';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if (empty($result)){
            $this->error();
            exit;
        }

        $result = $this->formatResult($result);

        header('Content-Type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    /*
     * type/name/{intl}/{name}
     */
    public function typeName($intl, $name)
    {
        $sql = 'SELECT type_id 
        FROM type_name 
        WHERE lang = :intl
        AND name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            'intl' => $intl,
            ':name' => $name
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $this->typeId($result['type_id']);
    }
}
