CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
CREATE TABLE IF NOT EXISTS messages (
    id INT PRIMARY KEY,
    message VARCHAR(255) NOT NULL
);
INSERT INTO messages (id, message) VALUES (1, 'Hello World from DevOps Pipeline');
