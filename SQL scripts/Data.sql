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

INSERT INTO Goals(name, target_amount, money_saved, status, deadline, account_id)
VALUES( 'Goal1', 300000, 300000, 'IN PROGRESS', '2018-12-08 00:00:00', 14),
 ( 'Goal31', 375000, 72000, 'IN PROGRESS', '2018-08-22 09:59:44', 4 ),
 ( 'Goal2', 84000, 25000, 'IN PROGRESS', '2018-06-09 14:24:35', 2 ),
 ( 'Goal3', 244000, 220000, 'IN PROGRESS', '2018-10-13 18:04:49', 5 ),
 ( 'Goal4', 901000, 437000, 'IN PROGRESS', '2016-10-17 21:42:16', 12 ),
 ( 'Goal5', 616000, 616000, 'IN PROGRESS', '2017-12-19 14:11:13', 12 ),
 ( 'Goal6', 143000, 10000, 'IN PROGRESS', '2017-11-11 20:08:33', 13 ),
 ( 'Goal7', 987000, 779000, 'IN PROGRESS', '2017-05-23 06:11:48', 3 ),
 ( 'Goal8', 920000, 920000, 'IN PROGRESS', '2018-12-06 09:16:54', 14 ),
 ( 'Goal9', 58000, 17000, 'IN PROGRESS', '2016-10-21 05:53:36', 12 ),
 ( 'Goal10', 212000, 212000, 'IN PROGRESS', '2018-12-28 18:26:12', 8 ),
 ( 'Goal11', 850000, 409000, 'IN PROGRESS', '2017-04-26 02:34:05', 8 ),
 ( 'Goal12', 927000, 373000, 'IN PROGRESS', '2016-09-27 09:17:49', 9 ),
 ( 'Goal13', 950000, 117000, 'IN PROGRESS', '2017-08-14 23:44:13', 13 ),
 ( 'Goal14', 619000, 418000, 'IN PROGRESS', '2017-08-06 17:26:16', 8 ),
 ( 'Goal15', 634000, 119000, 'IN PROGRESS', '2016-02-24 05:15:27', 12 ),
 ( 'Goal16', 983000, 856000, 'IN PROGRESS', '2016-09-21 22:43:50', 10 ),
 ( 'Goal17', 775000, 134000, 'IN PROGRESS', '2018-09-07 21:16:12', 8 ),
 ( 'Goal18', 985000, 270000, 'IN PROGRESS', '2016-07-17 20:56:45', 14 ),
 ( 'Goal19', 481000, 347000, 'IN PROGRESS', '2018-03-05 19:07:51', 11 ),
 ( 'Goal20', 957000, 957000, 'IN PROGRESS', '2018-12-25 15:09:06', 8 ),
 ( 'Goal21', 315000, 201000, 'IN PROGRESS', '2016-07-05 17:51:24', 8 ),
 ( 'Goal22', 581000, 373000, 'IN PROGRESS', '2018-01-13 21:18:37', 12 ),
 ( 'Goal23', 770000, 342000, 'IN PROGRESS', '2018-05-25 05:45:42', 7 ),
 ( 'Goal24', 506000, 469000, 'IN PROGRESS', '2017-04-22 08:25:56', 10 ),
 ( 'Goal25', 325000, 268000, 'IN PROGRESS', '2017-12-27 04:19:40', 4 ),
 ( 'Goal26', 485000, 485000, 'IN PROGRESS', '2016-12-27 12:16:38', 9 ),
 ( 'Goal27', 471000, 471000, 'IN PROGRESS', '2016-12-23 11:42:15', 9 ),
 ( 'Goal28', 897000, 897000, 'IN PROGRESS', '2018-12-24 23:27:53', 3 ),
 ( 'Goal29', 318000, 318000, 'IN PROGRESS', '2018-12-26 01:58:22', 9 ),
 ( 'Goal30', 485000, 485000, 'IN PROGRESS', '2018-12-22 10:55:17', 10 ) ;

INSERT INTO Pockets( pocket_name, amount, created_at, account_id)
VALUES
( 'bike maintenance', 493800, '2016-07-21 19:26:49', 1 ),
 ( 'car maintenance', 95500, '2018-09-28 23:42:14', 2 ),
 ( 'for food', 395400, '2018-10-13 03:03:08', 2 ),
 ( 'house services', 80500, '2016-01-05 09:13:18', 2 ),
 ( 'transport', 331100, '2017-02-12 17:19:41', 2 ),
 ( 'bike maintenance', 451100, '2016-05-10 08:18:02', 3 ),
 ( 'bike maintenance', 368300, '2016-02-06 08:14:50', 4 ),
 ( 'for food', 324400, '2016-09-05 01:19:24', 4 ),
 ( 'transport', 3200, '2018-03-01 22:17:55', 4 ),
 ( 'bike maintenance', 220700, '2017-12-03 02:56:53', 5 ),
 ( 'clothes for the children', 477800, '2018-01-14 01:12:03', 5 ),
 ( 'for food', 182200, '2016-01-18 22:16:55', 5 ),
 ( 'bike maintenance', 280200, '2016-01-08 17:55:12', 6 ),
 ( 'car maintenance', 409200, '2017-10-26 11:53:20', 6 ),
 ( 'house services', 145700, '2018-11-20 14:14:24', 6 ),
 ( 'miscelanious', 184200, '2018-05-02 00:12:47', 6 ),
 ( 'transport', 114300, '2016-06-10 17:34:07', 6 ),
 ( 'clothes for the children', 147700, '2017-09-27 19:14:43', 7 ),
 ( 'miscelanious', 256700, '2017-03-24 22:28:38', 7 ),
 ( 'transport', 274200, '2016-08-11 14:50:49', 7 ),
 ( 'bicycle maintenance', 103800, '2017-04-11 17:52:08', 8 ),
 ( 'car maintenance', 101700, '2016-12-20 17:25:46', 8 ),
 ( 'clothes for the children', 232700, '2018-01-25 18:14:48', 8 ),
 ( 'for food', 121600, '2017-01-01 22:50:30', 8 ),
 ( 'car maintenance', 16400, '2016-10-03 00:10:23', 9 ),
 ( 'leasehold', 314800, '2018-01-18 23:29:20', 9 ),
 ( 'transport', 135800, '2017-10-16 07:16:34', 9 ),
 ( 'clothes for the children', 464100, '2018-08-19 09:42:01', 10 ),
 ( 'transport', 235600, '2017-04-19 02:51:17', 10 ),
 ( 'bike maintenance', 280700, '2017-10-05 04:49:19', 11 ),
 ( 'house services', 14700, '2018-01-22 13:59:46', 11 ),
 ( 'leasehold', 393900, '2017-12-04 17:18:31', 11 ),
 ( 'miscelanious', 9100, '2018-09-19 01:59:18', 11 ),
 ( 'transport', 475600, '2017-05-03 11:30:11', 11 ),
 ( 'bike maintenance', 456800, '2017-05-02 01:02:43', 12 ),
 ( 'bike maintenance', 356400, '2017-03-20 22:16:32', 13 ),
 ( 'miscelanious', 282700, '2016-09-05 12:01:20', 13 ),
 ( 'bicycle maintenance', 438700, '2017-05-17 03:04:26', 14 ),
 ( 'for food', 462200, '2016-08-23 11:19:40', 14 ),
 ( 'house services', 166200, '2016-03-22 20:39:32', 14 ),
 ( 'miscelanious', 434100, '2018-06-04 19:59:13', 14 );

 INSERT INTO Transactions( type, amount, transaction_date, `where`, user_id, account_id )
VALUES
( 'recharge', 585000, '2017-03-28 12:40:33', 'transport', 15, 13 ),
( 'remittance', 452000, '2017-08-26 10:24:52', 'leasehold', 14, 8 ),
( 'withdrawal', 628000, '2018-07-18 17:30:34', 'bike maintenance', 10, 6 ),
( 'withdrawal', 548000, '2018-03-26 14:56:21', 'leasehold', 11, 14 ),
( 'recharge', 452000, '2017-03-26 03:49:33', 'for food', 10, 11 ),
( 'reception', 615000, '2016-01-28 05:02:03', 'clothes for the children', 3, 5 ),
( 'recharge', 230000, '2017-08-12 21:29:59', 'bicycle maintenance', 14, 8 ),
( 'remittance', 449000, '2018-12-19 02:07:02', 'house services', 12, 10 ),
( 'reception', 683000, '2018-02-13 21:29:53', 'available_balance', 7, 8 ),
( 'reception', 487000, '2017-12-04 16:24:34', 'available_balance', 3, 1 ),
( 'reception', 63000, '2018-01-12 19:52:15', 'transport', 3, 5 ),
( 'reception', 272000, '2017-09-17 01:23:12', 'bicycle maintenance', 2, 4 ),
( 'withdrawal', 131000, '2017-04-23 23:49:14', 'clothes for the children', 8, 8 ),
( 'withdrawal', 585000, '2018-12-02 13:21:58', 'house services', 14, 5 ),
( 'remittance', 280000, '2017-05-28 01:10:56', 'leasehold', 4, 10 ),
( 'recharge', 410000, '2018-02-20 23:57:53', 'leasehold', 3, 14 ),
( 'recharge', 519000, '2017-01-15 17:04:55', 'clothes for the children', 3, 14 ),
( 'remittance', 284000, '2017-06-21 06:06:34', 'bicycle maintenance', 6, 9 ),
( 'reception', 171000, '2017-08-11 14:23:46', 'for food', 12, 1 ),
( 'remittance', 129000, '2017-08-26 05:13:02', 'bike maintenance', 15, 2 ),
( 'reception', 568000, '2016-02-04 01:10:04', 'bicycle maintenance', 3, 8 ),
( 'reception', 568000, '2016-02-13 23:52:56', 'miscelanious', 8, 1 ),
( 'reception', 194000, '2017-10-16 13:36:21', 'bicycle maintenance', 6, 10 ),
( 'reception', 96000, '2016-11-11 16:40:31', 'car maintenance', 7, 6 ),
( 'remittance', 58000, '2017-01-18 10:02:44', 'miscelanious', 15, 14 ),
( 'remittance', 70000, '2017-04-01 07:57:38', 'bike maintenance', 8, 8 ),
( 'remittance', 431000, '2017-10-09 09:40:54', 'house services', 11, 12 ),
( 'withdrawal', 249000, '2017-08-11 01:22:22', 'available_balance', 4, 11 ),
( 'recharge', 317000, '2018-12-24 15:16:33', 'leasehold', 14, 14 ),
( 'withdrawal', 521000, '2016-06-16 08:18:10', 'clothes for the children', 12, 2 ),
( 'remittance', 496000, '2018-03-13 04:03:34', 'house services', 13, 11 ),
( 'withdrawal', 417000, '2016-10-04 21:48:20', 'available_balance', 5, 14 ),
( 'recharge', 117000, '2016-05-15 11:12:22', 'bike maintenance', 8, 10 ),
( 'withdrawal', 251000, '2016-09-24 20:01:33', 'house services', 7, 10 ),
( 'withdrawal', 40000, '2017-09-25 06:25:59', 'bicycle maintenance', 5, 4 ),
( 'withdrawal', 314000, '2016-03-23 07:20:21', 'leasehold', 13, 14 ),
( 'withdrawal', 229000, '2018-06-14 19:18:01', 'for food', 4, 10 ),
( 'recharge', 436000, '2016-12-04 02:54:57', 'house services', 10, 13 ),
( 'reception', 128000, '2016-02-27 04:11:25', 'transport', 8, 7 ),
( 'recharge', 660000, '2017-07-07 10:51:04', 'car maintenance', 10, 12 ),
( 'remittance', 371000, '2016-12-17 01:33:56', 'car maintenance', 3, 9 ),
( 'withdrawal', 390000, '2018-07-07 11:47:54', 'for food', 6, 9 ),
( 'recharge', 298000, '2017-05-03 04:16:32', 'bike maintenance', 9, 9 ),
( 'recharge', 508000, '2017-01-16 11:13:59', 'leasehold', 8, 11 ),
( 'reception', 696000, '2016-02-13 06:20:05', 'leasehold', 9, 13 ),
( 'remittance', 264000, '2017-03-11 17:35:14', 'car maintenance', 3, 1 ),
( 'withdrawal', 89000, '2016-05-04 14:27:59', 'miscelanious', 3, 9 ),
( 'remittance', 155000, '2017-05-14 00:14:11', 'transport', 10, 12 ),
( 'remittance', 69000, '2017-03-03 03:49:55', 'miscelanious', 7, 2 ),
( 'recharge', 624000, '2018-08-03 17:22:24', 'bicycle maintenance', 9, 6 );
