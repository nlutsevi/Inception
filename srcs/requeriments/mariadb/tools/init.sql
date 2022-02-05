CREATE USER 'root'@'%' IDENTIFIED BY 'rootp';
CREATE DATABASE bbdd;
CREATE USER 'user'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON bbdd.* TO 'user'@'%';
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'rootp';
FLUSH PRIVILEGES;