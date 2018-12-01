class TransactionsDatabase < Database

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

  def getTransactions (accountId, number)
		transactions = []
		@client.query("SELECT * FROM Transactions WHERE account_id = #{accountId} ORDER BY transaction_date DESC LIMIT #{number}").each do |row|
			email = ""
			@client.query("SELECT email FROM Users WHERE user_id = #{row["user_id"]}").each do |row2|
				email = row2["email"]
			end
			registry = [row["transaction_date"], row["type"], row["amount"], email, row["where"]]
			transactions << registry
		end
		return transactions
	end
end
