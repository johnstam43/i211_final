<?php

class InventoryModel
{
    private $db;
    private $dbConnection;
    static private $_instance = NULL;

    private function __construct()
    {
        $this->db = Database::getDatabase();
        $this->dbConnection = $this->db->getConnection();

        //Escapes special characters in a string for use in an SQL statement. This stops SQL inject in POST vars. 
        foreach ($_POST as $key => $value) {
            $_POST[$key] = $this->dbConnection->real_escape_string($value);
        }

        //Escapes special characters in a string for use in an SQL statement. This stops SQL Injection in GET vars 
        foreach ($_GET as $key => $value) {
            $_GET[$key] = $this->dbConnection->real_escape_string($value);
        }
    }

    public static function getInventoryModel()
    {
        if (self::$_instance == NULL) {
            self::$_instance = new InventoryModel();
        }
        return self::$_instance;
    }

    public function getAll()
    {
        $sql = "select * from inventory";

        $query = $this->dbConnection->query($sql);

        if (!$query) return false;

        return $query->fetch_assoc();
    }
}