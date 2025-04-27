<?php
// Database configuration
$db = [
    'db_host' => 'localhost',
    'db_user' => 'root',
    'db_pass' => 'creation11111',
    'db_name' => 'tc_ewsd1'
];

// Define constants
foreach ($db as $key => $value) {
    define(strtoupper($key), $value);
}

// Create connection
$connection = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Check connection
if (!$connection) {
    die("Database connection failed: " . mysqli_connect_error());
}

// Optional: Uncomment this to confirm connection during testing
// echo "Database connected successfully";
?>

