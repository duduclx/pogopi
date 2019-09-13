<?php


namespace api\Model;

USE PDO;

class Version
{
    private $pdo;

    public function __construct()
    {
        include ('Controller/config.php');
        $this->pdo = new PDO("mysql:dbname=$dbname;host=$host;charset=UTF8", $username, $password);
    }

    public function error()
    {
        $result['error'] = 400;
        header('Content-type: application/json');
        echo json_encode($result);
    }

    /*
     * api/version
     */
    public function version()
    {
        $query = $this->pdo->prepare('SELECT version FROM version');
        $query->execute();

        $result = $query->fetch(PDO::FETCH_ASSOC);

        if(empty($result)) {
            $this->error();
            exit;
        }

        header('Content-type: application/json');
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }
}
