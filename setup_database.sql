CREATE USER IF NOT EXISTS 'foreignkeys'@'localhost' IDENTIFIED BY 'nonosql';
CREATE DATABASE IF NOT EXISTS foreignkeys;
GRANT ALL PRIVILEGES ON foreignkeys.* TO 'foreignkeys'@'localhost';
