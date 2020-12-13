CREATE DATABASE IF NOT EXISTS mycal
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mycal;

CREATE TABLE IF NOT EXISTS algo (
    no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT "sequence",
    name VARCHAR(32) COMMENT "same as that of table 'user'",
    op1 VARCHAR(32),
    sub1 INT(32),
    op2 VARCHAR(32),
    sub2 INT(32)
);


