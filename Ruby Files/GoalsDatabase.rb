class GoalsDatabase < Database
  def updateStatusGoals
    @client.query("UPDATE Goals SET status = 'BEATEN' WHERE deadline < CURRENT_TIMESTAMP AND money_saved < target_amount")
    @client.query("UPDATE Goals SET status = 'ACHIEVED' WHERE deadline >= CURRENT_TIMESTAMP AND money_saved >= target_amount")
  end

  def getGoals (accountId)
    goals = []
		@client.query("SELECT * FROM Goals WHERE account_id = #{accountId}").each do |row|
			registry = [row["name"], row["target_amount"], row["money_saved"], row["status"], row["deadline"]]
			goals << registry
		end
		return goals
  end

  def addGoal (accountId, name, targetAmount, deadline)
    @client.query"INSERT INTO Goals(name, target_amount, money_saved, status, deadline, account_id) VALUES( '#{name}', #{targetAmount}, 0, 'IN PROGRESS', '#{deadline}', #{accountId})"
  end

  def deleteGoal (accountId, goalName, amount)
		balance = self.getAvailableBalance (accountId)
		@client.query"DELETE FROM Goals WHERE(account_id = #{accountId} AND name = '#{goalName}')"
		@client.query("UPDATE Accounts SET available_balance = #{balance + amount} WHERE account_id = #{accountId}")
	end

  def addMoneyToGoal (accountId, goalName, targetAmount, amount, money)
		balance = self.getAvailableBalance (accountId)
		@client.query("UPDATE Goals SET money_saved = #{amount + money} WHERE (account_id = #{accountId} AND name = '#{goalName}')")
    if targetAmount <= amount + money
      	@client.query("UPDATE Goals SET status = 'ACHIEVED' WHERE (account_id = #{accountId} AND name = '#{goalName}')")
    end
		@client.query("UPDATE Accounts SET available_balance = #{balance - money} WHERE account_id = #{accountId}")
	end
end
