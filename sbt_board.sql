DROP DATABASE IF EXISTS sbt_board;
CREATE DATABASE sbt_board;
USE sbt_board;

CREATE TABLE `tb_member`
(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL
);
