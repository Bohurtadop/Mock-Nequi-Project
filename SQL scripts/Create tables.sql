create table if not exists Users (
	user_id INT PRIMARY KEY NOT NULL UNIQUE auto_increment,
    name varchar(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

create table if not exists Accounts (
	account_id INT PRIMARY KEY NOT NULL UNIQUE,
    user_id INT NOT NULL UNIQUE,
    available_balance INT NOT NULL,
    maittress_amount INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

create table if not exists Transactions (
	transaction_id INT PRIMARY KEY NOT NULL UNIQUE,
    account_id INT NOT NULL,
    type VARCHAR(20) NOT NULL,
    user_id INT NULL,
    amount INT NOT NULL,
    time TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO Users(name, lastname, email, password) VALUES('Brayan', 'Hurtado', 'bohurtadop@unal.edu.co', SHA2('Pass1234', 224));
INSERT INTO Users(name, lastname, email, password) VALUES('Yolanda', 'Zuluaga', 'Yozuluaga@unal.edu.co', SHA2('Yola1212', 224));
INSERT INTO Accounts(account_id, user_id, available_balance, maittress_amount) VALUES(1001, 1, 50000, 10000);
INSERT INTO Accounts(account_id, user_id, available_balance, maittress_amount) VALUES(1002, 2, 20000, 5000);
INSERT INTO Transactions(transaction_id, account_id, type, user_id, amount, time) VALUES(101, 1001, 'sending', 2, 10000, '2018-11-23 19:34:23');
SELECT * FROM Users WHERE user_id = 001;
SELECT * FROM Users WHERE email = "bohurtadop@unal.edu.co";
SELECT SHA2('Yola1212', 224);
SELECT * FROM (Accounts JOIN Users ON Accounts.user_id = Users.user_id) JOIN Transactions ON Transactions.account_id = Accounts.account_id;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'unal9712';