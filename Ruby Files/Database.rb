require 'mysql2'

class Database

	def initialize
		@client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "unal9712", :database => "nequi")
		# @client = Mysql2::Client.new(:host => "localhost", :username => "icortes", :password => "pass", :database => "mock_nequi")
		# results = client.query("SELECT * FROM Users WHERE user_id = 1")
		# client.query("SELECT * FROM Users WHERE user_id = 1").each do |row|
  	# 	print row["name"]
		# 	print row["user_id"]
		# end
		# client.query("INSERT INTO Users(user_id, name, lastname, email, pass) VALUES(3, 'Yeison', 'Preciado', 'funcionoome@unal.edu.co', SHA2('Pass1234', 224))")
		# client.query("SELECT SHA2('Yola1212', 224)").each do |row|
		# 	print "\n"
  	# 	print row["SHA2('Yola1212', 224)"]
		# end
	end

	def addUser (name, lastname, email, password)
		@client.query("INSERT INTO Users(name, lastname, email, password) VALUES('#{name}', '#{lastname}', '#{email}', SHA2('#{password}', 224))")
		self.addAccount(email)
	end

	def addMoney (accountId, money)
		balance = self.getAvailableBalance (accountId)
		@client.query("UPDATE Accounts SET available_balance = #{balance + money} WHERE account_id = #{accountId}")
		@client.query("INSERT INTO Transactions(`type`, amount, `where`, user_id, account_id) VALUES('recharge', #{money}, 'Available balance', #{accountId}, #{accountId})")
	end

	def withdrawMoney (accountId, money, where)
		balance = self.getAvailableBalance (accountId)
		@client.query("UPDATE Accounts SET available_balance = #{balance - money} WHERE account_id = #{accountId}")
		@client.query("INSERT INTO Transactions(`type`, amount, `where`, user_id, account_id) VALUES('withdrawal', #{money}, '#{where}', #{accountId}, #{accountId})")
	end

	def sendMoney (accountId, email, money, where)
		userId = 0
		balance = self.getAvailableBalance (accountId)
		@client.query("UPDATE Accounts SET available_balance = #{balance - money} WHERE account_id = #{accountId}")
		@client.query("SELECT user_id FROM Users WHERE email = '#{email}'").each do |row|
			userId = row["user_id"]
		end
		@client.query("INSERT INTO Transactions(`type`, amount, `where`, user_id, account_id) VALUES('remittance', #{money}, '#{where}', #{userId}, #{accountId})")
		balance = self.getAvailableBalance (userId)
		@client.query("UPDATE Accounts SET available_balance = #{balance + money} WHERE account_id = #{userId}")
		@client.query("INSERT INTO Transactions(`type`, amount, `where`, user_id, account_id) VALUES('reception', #{money}, 'Available balance', #{accountId}, #{userId})")
	end

	def addAccount (email)
		@client.query("SELECT user_id FROM Users WHERE email = '#{email}'").each do |row|
  	 	user_id = row["user_id"]
			@client.query("INSERT INTO Accounts(available_balance, mattress_amount, user_id) VALUES( 0, 0, #{user_id})")
		end
	end

	def getFullname (email)
		@client.query("SELECT * FROM Users WHERE email = '#{email}'").each do |row|
  	 	name = row["name"]
			lastname = row["lastname"]
			return name + " " + lastname
		end
	end

	def getAvailableBalance (accountId)
		@client.query("SELECT available_balance FROM Accounts WHERE account_id = #{accountId}").each do |row|
			return row["available_balance"]
		end
	end

	def getTotalBalance (accountId)
		pocketsBalance = 0
		goalsBalance = 0
		mattress_amount = 0
		@client.query("SELECT amount FROM Pockets WHERE account_id = #{accountId}").each do |row|
  	 	pocketsBalance = pocketsBalance + row["amount"]
		end
		@client.query("SELECT money_saved FROM Goals WHERE account_id = #{accountId}").each do |row|
  	 	goalsBalance = goalsBalance + row["money_saved"]
		end
		@client.query("SELECT mattress_amount FROM Accounts WHERE account_id = #{accountId}").each do |row|
			mattress_amount = row["mattress_amount"]
		end
		@client.query("SELECT available_balance FROM Accounts WHERE account_id = #{accountId}").each do |row|
			return pocketsBalance + goalsBalance + mattress_amount + row["available_balance"]
		end
	end

	def getAccountId (email)
		@client.query("SELECT account_id FROM Accounts WHERE user_id = (SELECT user_id FROM Users WHERE email = '#{email}')").each do |row|
			return row["account_id"]
		end
	end

	def getTransactions (accountId)
		transactions = []
		@client.query("SELECT * FROM Transactions WHERE account_id = #{accountId} ORDER BY transaction_date DESC LIMIT 10").each do |row|
			email = ""
			@client.query("SELECT email FROM Users WHERE user_id = #{row["user_id"]}").each do |row2|
				email = row2["email"]
			end
			registry = [row["transaction_date"], row["type"], row["amount"], email, row["where"]]
			transactions << registry
		end
		return transactions
	end

	def validateEmail (email)
		results = @client.query("SELECT * FROM Users WHERE email = '#{email}'")
		if results.count != 0
			return true
		else
			return false
		end
	end

	def validatePassword (email, password)
		@client.query("SELECT SHA2('#{password}', 224)").each do |row|
  	 	password = row["SHA2('#{password}', 224)"]
		end
		@client.query("SELECT * FROM Users WHERE email = '#{email}'").each do |row|
  	 	if password == row["password"]
				return true
			else
				return false
			end
		end
	end
end
