class MattressDatabase < Database
  
  def getMattressAmount (accountId)
		@client.query("SELECT mattress_amount FROM Accounts WHERE account_id = #{accountId}").each do |row|
			return row["mattress_amount"]
		end
	end

	def addMoneyToMattress (accountId, money)
		balance = self.getAvailableBalance (accountId)
		mattressAmount = self.getMattressAmount (accountId)
		@client.query("UPDATE Accounts SET available_balance = #{balance - money}, mattress_amount = #{mattressAmount + money} WHERE account_id = #{accountId}")
	end

  def withdrawMoneyFromMattress (accountId, money)
		balance = self.getAvailableBalance (accountId)
		mattressAmount = self.getMattressAmount (accountId)
		@client.query("UPDATE Accounts SET available_balance = #{balance + money}, mattress_amount = #{mattressAmount - money} WHERE account_id = #{accountId}")
	end
end
