<?php
ini_set('display_errors', $_ENV['DISPLAY_ERRORS'] ?? 0);
error_reporting(E_ALL);

session_start();
session_regenerate_id(true);

header('X-Frame-Options: DENY');
header('X-Content-Type-Options: nosniff');
header('X-XSS-Protection: 1; mode=block');
