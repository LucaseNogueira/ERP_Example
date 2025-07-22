<?php

class Database
{
    private static $pdo;

    public static function connect()
    {
        if (!self::$pdo) {
            $host = $_ENV['DB_HOST'];
            $port = $_ENV['DB_PORT'] || "3001";
            $dbname = $_ENV['DB_NAME'];
            $user = $_ENV['DB_USER'];
            $pass = $_ENV['DB_PASS'];

            $dsn = "mysql:host=$host:$port;dbname=$dbname;charset=utf8mb4";
            self::$pdo = new PDO(
                $dsn,
                $user,
                $pass,
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                ]
            );
        }

        return self::$pdo;
    }
}
