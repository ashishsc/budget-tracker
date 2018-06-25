CREATE TABLE user (
    username varchar(255) PRIMARY KEY
)

CREATE TABLE category (
    name varchar(255) PRIMARY KEY
)

CREATE TABLE expense (
    id INT PRIMARY KEY,
    category varchar(255) REFERENCES category(name),
    name varchar(45) NOT NULL,
    value int NOT NULL,
    user varchar(255) REFERENCES user(username)
)