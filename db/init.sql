CREATE DATABASE InCognito;

use InCognito;

CREATE TABLE IF NOT EXISTS users(
user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(50) UNIQUE NOT NULL,
hashed_password VARCHAR(1000) NOT NULL,
email VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS contacts(
user_id INT NOT NULL REFERENCES users(user_id),
contact_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS pke(
user_id INT NOT NULL REFERENCES users(user_id),
device_id INT NOT NULL REFERENCES devices(device_id),
user_pke VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS messages(
message_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sender INT REFERENCES users(user_id),
receiver INT REFERENCES users(user_id),
message TEXT,
time INT NOT NULL
);

INSERT INTO users(user_name, hashed_password, email) VALUES
('TTTriplicate', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'tttriplicate@gmail.com'),
('mattMon', 'e6c3da5b206634d7f3f3586d747ffdb36b5c675757b380c6a5fe5c570c714349', 'matthew.monsour1@snhu.edu'),
('AAlex', '1ba3d16e9881959f8c9a9762854f72c6e6321cdd44358a10a4e939033117eab9', 'alexandro.crawford@snhu.edu');


INSERT INTO messages(message, sender, receiver, time) VALUES
('This is a test for pulling', 1, 2, UNIX_TIMESTAMP()),
('This is a second one', 3, 1, UNIX_TIMESTAMP());

CREATE USER 'API'@'%' IDENTIFIED BY 'G3n3r1cP@ssw0rd!';
GRANT SELECT, INSERT, DELETE on InCognito.* to 'API'@'%';