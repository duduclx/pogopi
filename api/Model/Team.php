<?php


namespace api\Model;

use PDO;

class Team
{
    private $pdo;
    private $sql;
    private $urlTeamImg;

    /*
     * ROUTES
     * api/team/all
     * api/team/id/{id}
     * api/team/name/{intl}/{name}
     */

    public function __construct()
    {
        include ('Controller/config.php');
        $this->urlTeamImg = $urlTeamImg;

        $this->pdo = new PDO(
            "mysql:dbname=$dbname;host=$host;charset=UTF8",
            $username,
            $password);
        $this->sql = '
            SELECT 
            team.id,
            team.color,
            team.emblem_flat_png,
            team.emblem_png,
            team.emblem_svg,
            team.player,
            team.image,
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
        // format images url
        $result['emblem_flat_png'] = $this->urlTeamImg . $result['emblem_flat_png'];
        $result['emblem_png'] = $this->urlTeamImg . $result['emblem_png'];
        $result['emblem_svg'] = $this->urlTeamImg . $result['emblem_svg'];
        $result['image'] = $this->urlTeamImg . $result['image'];
        // create name array
        $result['langs'] = explode(',', $result['langs']);
        $result['names'] = explode(',', $result['names']);
        for($i = 0; $i < count($result['langs']); $i++) {
            $result['name'][$result['langs'][$i]] = $result['names'][$i];
        }
        unset($result['langs']);
        unset($result['names']);

        return $result;
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
        echo json_encode($team, JSON_NUMERIC_CHECK);
    }

    /*
     * api/team/max
     */
    public function teamMax()
    {
        $sql = 'SELECT COUNT(id) AS maxTeam FROM team';

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
     * api/team/id/{id}
     */
    public function teamId($number)
    {
        $sql = $this->sql . ' WHERE id = :number';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':number' => $number
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result['id'])) {
            $this->error();
            exit;
        }

        $result = $this->formatResult($result);

        header('Content-type: application/json');
        echo json_encode($result,JSON_NUMERIC_CHECK);
    }

    /*
     * api/team/name/{intl}/{name}
     */
    public function teamName($intl, $name)
    {
        $sql = 'SELECT team_id FROM team_name
            WHERE lang = :intl
            AND name LIKE CONCAT(\'%\', :name, \'%\')';

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':intl' => $intl,
            ':name' => $name
        ]);

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if (empty($result)) {
            $this->error();
            exit;
        }

        $this->teamId($result['team_id']);
    }
}
