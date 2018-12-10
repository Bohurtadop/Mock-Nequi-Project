class PocketsDatabase < Database
  def addMoneyToPocket(accountId, pocketName, amount, money)
    balance = getAvailableBalance accountId
    @client.query("UPDATE Pockets SET amount = #{amount + money} WHERE (account_id = #{accountId} AND pocket_name = '#{pocketName}')")
    @client.query("UPDATE Accounts SET available_balance = #{balance - money} WHERE account_id = #{accountId}")
  end

  def withdrawMoneyFromPocket(accountId, pocketName, amount, money)
    balance = getAvailableBalance accountId
    @client.query("UPDATE Pockets SET amount = #{amount - money} WHERE (account_id = #{accountId} AND pocket_name = '#{pocketName}')")
    @client.query("UPDATE Accounts SET available_balance = #{balance + money} WHERE account_id = #{accountId}")
  end

  def addPocket(accountId, pocketName)
    @client.query "INSERT INTO Pockets(pocket_name, amount, account_id) VALUES( '#{pocketName}', 0, #{accountId})"
  end

  def deletePocket(accountId, pocketName, amount)
    balance = getAvailableBalance accountId
    @client.query "DELETE FROM Pockets WHERE(account_id = #{accountId} AND pocket_name = '#{pocketName}')"
    @client.query("UPDATE Accounts SET available_balance = #{balance + amount} WHERE account_id = #{accountId}")
  end

  def sendMoneyFromPocket(accountId, email, pocketData, money, where)
    userId = 0
    @client.query("UPDATE Pockets SET amount = #{pocketData[1] - money} WHERE (account_id = #{accountId} AND pocket_name = '#{pocketData[0]}')")
    @client.query("SELECT user_id FROM Users WHERE email = '#{email}'").each do |row|
      userId = row['user_id']
    end
    @client.query("INSERT INTO Transactions(`type`, amount, `where`, user_id, account_id) VALUES('remittance', #{money}, '#{where}', #{userId}, #{accountId})")
    balance = getAvailableBalance userId
    @client.query("UPDATE Accounts SET available_balance = #{balance + money} WHERE account_id = #{userId}")
    @client.query("INSERT INTO Transactions(`type`, amount, `where`, user_id, account_id) VALUES('reception', #{money}, 'Available balance', #{accountId}, #{userId})")
  end

  def getPockets(accountId)
    pockets = []
    @client.query("SELECT * FROM Pockets WHERE account_id = #{accountId}").each do |row|
      registry = [row['pocket_name'], row['amount']]
      pockets << registry
    end
    pockets
  end
end
