INSERT INTO Users(name, lastname, email, password)
VALUES
 ('Joel David', 'Moore', 'email1@falsemail.com', SHA2('Pass6601', 224) ),
 ('Orlando', 'Bloom', 'email2@falsemail.com', SHA2('Pass6602', 224) ),
 ('Rory', 'Kinnear', 'email3@falsemail.com', SHA2('Pass6603', 224) ),
 ('Christian', 'Bale', 'email4@falsemail.com', SHA2('Pass6604', 224) ),
 ('Rob', 'Walker', 'email5@falsemail.com', SHA2('Pass6605', 224) ),
 ('Samantha', 'Morton', 'email6@falsemail.com', SHA2('Pass6606', 224) ),
 ('James', 'Franco', 'email7@falsemail.com', SHA2('Pass6607', 224) ),
 ('Donna', 'Murphy', 'email8@falsemail.com', SHA2('Pass6608', 224) ),
 ('Robert', 'Downey Jr.', 'email9@falsemail.com', SHA2('Pass6609', 224) ),
 ('Daniel', 'Radcliffe', 'email10@falsemail.com', SHA2('Pass6610', 224) ),
 ('Lauren', 'Cohan', 'email11@falsemail.com', SHA2('Pass6611', 224) ),
 ('Marlon', 'Brando', 'email12@falsemail.com', SHA2('Pass6612', 224) ),
 ('Mathieu', 'Amalric', 'email13@falsemail.com', SHA2('Pass6613', 224) ),
 ('Orlando', 'Bloom', 'email14@falsemail.com', SHA2('Pass6614', 224) ),
 ('Ruth', 'Wilson', 'email15@falsemail.com', SHA2('Pass6615', 224) );

INSERT INTO Accounts(account_id, available_balance, mattress_amount, created_at, user_id)
VALUES
( 1, 504200, 29000, '2016-10-18 08:30:36', 1),
 ( 2, 92000, 6000, '2018-03-27 07:56:01', 2),
 ( 3, 17500, 17000, '2017-08-27 00:46:47', 3),
 ( 4, 0, 0, '2018-04-20 23:19:26', 4),
 ( 5, 326000, 22000, '2017-06-20 16:32:11', 5),
 ( 6, 86000, 30000, '2017-05-13 23:36:57', 6),
 ( 7, 3e+05, 28000, '2016-03-15 22:51:49', 7),
 ( 8, 9000, 0, '2016-08-18 00:47:39', 8),
 ( 9, 27100, 4000, '2016-05-25 23:31:53', 9),
 ( 10, 0, 0, '2017-07-12 11:47:23', 10),
 ( 11, 600, 0, '2017-12-20 13:03:48', 11),
 ( 12, 54700, 26000, '2017-07-08 23:41:55', 12),
 ( 13, 582000, 15000, '2017-04-27 10:42:09', 13),
 ( 14, 65600, 11000, '2016-02-28 07:58:58', 14),
 ( 15, 44000, 0, '2016-07-25 06:57:27', 15);

 INSERT INTO Goals(name, target_amount, money_saved, remaining_money, status, deadline, account_id)
-- VALUES( 'trip to mars', 300000000, 1000000, 2999900000, 'IN PROGRESS', '2050-10-18 00:00:00', 14);
VALUES( 'GOAL1', 300000, 10000, 290000, 'IN PROGRESS', '2018-12-08 00:00:00', 14);