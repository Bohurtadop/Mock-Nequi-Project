require 'mysql2'
@client = Mysql2::Client.new(:host => "localhost", :username => "icortes", :password => "pass", :database => "mock_nequi")
# Consulta de saldo disponible

def available_balance (user_id)
  results = @client.query("SELECT available_balance FROM Accounts WHERE user_id = '#{user_id}'")
  results = results.to_a[0]["available_balance"]
  return(results)
end
puts "\n \n resultado de available balance evaluado en 1 \n \n"
  puts available_balance(1)
  puts "\n \n"

# -- Consulta las últimas N transacciones
def last_n_transactions(account_id, n)
  results = @client.query("SELECT * FROM Transactions WHERE account_id = '#{account_id}'")
  if results.count < n
    n = results.count
  end
  results = @client.query("SELECT * FROM Transactions WHERE account_id = '#{account_id}'ORDER BY transaction_date DESC LIMIT #{n}")

  results.each do |row|
    puts "#{row} \n"
  end
  return(results)
end

# -- Consulta dinero en el colchon
def mattress_amount (user_id)
  results = @client.query("SELECT mattress_amount FROM Accounts WHERE user_id = '#{user_id}'")
  results = results.to_a[0]["mattress_amount"]
  # return(results)
end
puts "\n \n resultado de mattress_amount evaluado en 1 \n \n"
  puts mattress_amount(1)
  puts "\n \n"


# -- Listar la información de todos sus bolsillos

def pocket_information(account_id)
  results = @client.query("SELECT pocket_name, amount FROM Pockets WHERE account_id = '#{account_id}'")
    results.each do |row|
    puts "#{row} \n"
  end
  # return(results)
end

# -- Listar la información de todos sus metas
# SELECT name, target_amount, money_saved, remaining_money, status, deadline
# FROM Goals
# WHERE account_id = 14;
def pocket_information(account_id)
  results = @client.query("SELECT name, target_amount, money_saved, remaining_money, status, deadline FROM Goals WHERE account_id = '#{account_id}'")
    results.each do |row|
    puts "#{row} \n"
  end
  # return(results)
end
