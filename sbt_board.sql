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

CREATE TABLE `tb_board`
(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `contents` VARCHAR(500) NOT NULL,
    `hits` INT DEFAULT 0,
    `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(email) REFERENCES tb_member(email)
)

CREATE TABLE `tb_comment`
(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `board_id` INT NOT NULL,
    `writer` VARCHAR(255) NOT NULL,
    `contents` VARCHAR(500) NOT NULL,
    `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(board_id) REFERENCES tb_board(id)
)
