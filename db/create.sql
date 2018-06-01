CREATE TABLE user (
    username varchar(255) PRIMARY KEY
)

CREATE TABLE expense (
    id INT PRIMARY KEY,
    category varchar(45),
    name varchar(45),
    value int,
    user varchar(255) REFERENCES user(username)
)