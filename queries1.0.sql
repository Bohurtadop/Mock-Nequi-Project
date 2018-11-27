--user_id que inició sesion
U_ID_in_session = 1

-- Consulta de saldo disponible
SELECT available_balance FROM Accounts
WHERE user_id = 1 ;

-- Consulta las últimas N transacciones
SELECT * FROM Transactions
WHERE account_id = 1
ORDER BY DESC transaction_date DESC LIMIT 10;

SELECT * FROM Accounts
     ORDER BY  created_at DESC LIMIT 10;


-- Consulta dinero en el colchon
SELECT mattress_amount FROM Accounts
WHERE user_id = 1 ;

-- Listar la información de todos sus bolsillos
SELECT pocket_name, amount FROM Pockets
WHERE account_id = 1;

-- Listar la información de todos sus metas
SELECT name, target_amount, money_saved, remaining_money, status, deadline
FROM Goals
WHERE account_id = 14;
