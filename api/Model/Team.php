<?php


namespace api\Model;

use PDO;

class Team
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
            team.id,
            team.img,
            team.png,
            team.svg,
            team.player,
            GROUP_CONCAT(tn.lang) AS langs,
            GROUP_CONCAT(tn.name) AS names
            FROM team
            LEFT JOIN team_name AS tn ON tn.team_id = team.id
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
        // create name array
        $result['langs'] = explode(',', $result['langs']);
        $result['names'] = explode(',', $result['names']);
        for($i = 0; $i < count($result['langs']); $i++) {
            $result['name'][$result['langs'][$i]] = $result['names'][$i];
        }
        unset($result['langs']);
        unset($result['names']);
        $team[] = $result;

        return $team;
    }

    /*
     * api/team/id/{id}
     */
    public function teamId($number)
    {
        $sql = $this->sql . ' WHERE id = :name';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        $result = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/team/all
     */
    public function teamAll()
    {
        $sql = $this->sql . ' GROUP BY team.id';

        $query = $this->pdo->prepare($sql);
        $query->execute();

        $results = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($results)) {
            $this->error();
            exit;
        }

        foreach($results as $result) {
            $team[] = $this->formatResult($result);
        }

        header('Content-type: application/json');
        echo json_encode($team);
    }
}
