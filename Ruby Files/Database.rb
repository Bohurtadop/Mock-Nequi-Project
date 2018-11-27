require 'mysql2'

class Database

	def initialize
		@client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "unal9712", :database => "nequi")
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
	end

	def getFullname (email)
			email = "'"+email+"'"
		@client.query("SELECT * FROM Users WHERE email = #{email}").each do |row|
  	 	name = row["name"]
			lastname = row["lastname"]
			return name + " " + lastname
		end
	end

	def validateEmail (email)
		email = "'"+email+"'"
		results = @client.query("SELECT * FROM Users WHERE email = #{email}")
		if results.count != 0
			return true
		else
			return false
		end
	end

	def validatePassword (email, password)
		email = "'"+email+"'"
		password = "'"+password+"'"
		@client.query("SELECT SHA2(#{password}, 224)").each do |row|
  	 	password = row["SHA2(#{password}, 224)"]
		end
		@client.query("SELECT * FROM Users WHERE email = #{email}").each do |row|
  	 	if password == row["password"]
				return true
			else
				return false
			end
		end
	end
end
