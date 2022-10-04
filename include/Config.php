<?php

require_once __DIR__ . '/../vendor/autoload.php';

// Looing for .env at the root directory
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/..');
$dotenv->load();

/**
 * Database config variables
 */
$host = $_ENV['DB_HOST'];
$user = $_ENV['DB_USER'];
$database = $_ENV['DB_DATABASE'];
$password = $_ENV['DB_PASSWORD'];

define("DB_HOST", $host);
define("DB_USER", $user);
define("DB_PASSWORD", $password);
define("DB_DATABASE", $database);
?>