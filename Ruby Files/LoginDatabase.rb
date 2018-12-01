class LoginDatabase < Database
  
  def addUser (name, lastname, email, password)
		@client.query("INSERT INTO Users(name, lastname, email, password) VALUES('#{name}', '#{lastname}', '#{email}', SHA2('#{password}', 224))")
		self.addAccount(email)
	end

	def addAccount (email)
		@client.query("SELECT user_id FROM Users WHERE email = '#{email}'").each do |row|
  	 	user_id = row["user_id"]
			@client.query("INSERT INTO Accounts(user_id) VALUES(#{user_id})")
		end
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
