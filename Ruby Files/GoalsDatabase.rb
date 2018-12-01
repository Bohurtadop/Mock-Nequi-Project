class GoalsDatabase < Database

  def getGoals (accountId)
    goals = []
		@client.query("SELECT * FROM Goals WHERE account_id = #{accountId}").each do |row|
			registry = [row["name"], row["target_amount"], row["money_saved"], row["status"], row["deadline"]]
			goals << registry
		end
		return goals
  end
end
