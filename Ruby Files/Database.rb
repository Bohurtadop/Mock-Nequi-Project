require 'mysql2'

class Database
  def initialize
    @client = Mysql2::Client.new(host: 'localhost', username: 'root', password: '', database: 'mock_nequi', socket: '/opt/lampp/var/mysql/mysql.sock')
    # @client = Mysql2::Client.new(:host => "localhost", :username => "icortes", :password => "pass", :database => "mock_nequi")
  end

  def getFullname(email)
    @client.query("SELECT * FROM Users WHERE email = '#{email}'").each do |row|
      name = row['name']
      lastname = row['lastname']
      return name + ' ' + lastname
    end
  end

  def getAvailableBalance(accountId)
    @client.query("SELECT available_balance FROM Accounts WHERE account_id = #{accountId}").each do |row|
      return row['available_balance']
    end
  end

  def getTotalBalance(accountId)
    pocketsBalance = 0
    goalsBalance = 0
    mattress_amount = 0
    @client.query("SELECT amount FROM Pockets WHERE account_id = #{accountId}").each do |row|
      pocketsBalance += row['amount']
    end
    @client.query("SELECT money_saved FROM Goals WHERE account_id = #{accountId}").each do |row|
      goalsBalance += row['money_saved']
    end
    @client.query("SELECT mattress_amount FROM Accounts WHERE account_id = #{accountId}").each do |row|
      mattress_amount = row['mattress_amount']
    end
    @client.query("SELECT available_balance FROM Accounts WHERE account_id = #{accountId}").each do |row|
      return pocketsBalance + goalsBalance + mattress_amount + row['available_balance']
    end
  end

  def getAccountId(email)
    @client.query("SELECT account_id FROM Accounts WHERE user_id = (SELECT user_id FROM Users WHERE email = '#{email}')").each do |row|
      return row['account_id']
    end
  end
end
