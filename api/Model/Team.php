<?php


namespace api\Model;

use PDO;

class Team
{
    private $pdo;
    private $sql;

    // TODO fix team database
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
            colors,
            img_player,
            img_pngXl,
            img_pngXs,
            img_svg,
            names,
            players
            FROM team';
    }

    private function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/team/{id}
     */
    public function teamId($number)
    {
        switch (intval($number)) {
            case '0':
                // is string
                $sql = $this->sql . ' WHERE names LIKE CONCAT(\'%\', :name, \'%\')
                       OR colors LIKE CONCAT(\'%\', :name, \'%\')';
                break;
            default:
                // is number
                $sql = 'SELECT * FROM team WHERE id = :name';
                break;
        }

        $query = $this->pdo->prepare($sql);
        $query->execute([
            ':name' => $number
        ]);

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/team/all
     */
    public function teamAll()
    {
        $query = $this->pdo->prepare(
            'SELECT * FROM team');
        $query->execute();

        $result = $query->fetchAll(PDO::FETCH_ASSOC);

        var_dump($result);
        exit;

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result);
    }
}
