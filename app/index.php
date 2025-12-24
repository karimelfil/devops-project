<?php
header('Content-Type: text/plain');
$host = 'mysql';
$user = 'root';
$pass = 'password';
$db = 'testdb';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("MySQL Connection failed: " . $conn->connect_error);
}

$result = $conn->query("SELECT message FROM messages LIMIT 1");

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo $row['message'];
} else {
    echo "Hello World (default)";
}

$conn->close();
?>
