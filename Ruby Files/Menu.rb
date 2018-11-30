load 'Database.rb'
load 'GraphicMenu.rb'

class Menu

  def initialize
    @DB = Database.new
    @GM = GraphicMenu.new
    # STATE means which menu is active. 0: Home screen, 1: Sign in, 2: Sign up, 3: Main menu
    @state = 0
    self.controlMenu
  end

  def controlMenu
    case @state
    when 0
      @email = ""
      @encryptpass = ""
      @name = ""
      @lastname = ""
      @fullname = ""
      @transactions = ""
      @number = "_"
      @GM.homeScreen
      answer = self.getAnswer
      case answer
      when 0
        system('cls')
        print "Exit sucesfully."
        system(exit)
      when 1
        @state = 1
      when 2
        @state = 2
      end
    when 1
      @GM.signIn(@email, @encryptpass)
      self.getEmail
      if @state == 1
        system('cls')
        @GM.signIn(@email, @encryptpass)
        self.getPassword
        if @state == 1
          @state = 3
        end
      end
    when 2
      @GM.signUp(@name, @lastname, @email, @encryptpass)
      self.getName
      if @state == 2
        system('cls')
        @GM.signUp(@name, @lastname, @email, @encryptpass)
        self.getLastname
        if @state == 2
          system('cls')
          @GM.signUp(@name, @lastname, @email, @encryptpass)
          self.getEmail
          if @state == 2
            system('cls')
            @GM.signUp(@name, @lastname, @email, @encryptpass)
            self.getPassword
            if @state == 2
              @state = 3
            end
          end
        end
      end
    when 3
      @where = 'Available balance'
      @accountId = @DB.getAccountId(@email)
      @fullname = @DB.getFullname(@email)
      @GM.mainMenu(@fullname)
      answer = self.getAnswer
      system('cls')
      case answer
      when 0
        @state = 0
      when 1
        availableBalance = @DB.getAvailableBalance(@accountId)
        @GM.availableBalance(@fullname, availableBalance)
        self.getAnswer
      when 2
        totalBalance = @DB.getTotalBalance(@accountId)
        @GM.totalBalance(@fullname, totalBalance)
        self.getAnswer
      when 3
        @GM.addMoney(@fullname)
        money = self.getMoney
        if money != 0
          @DB.addMoney(@accountId, money)
        end
      when 4
        @GM.withdrawMoney(@fullname)
        money = self.getMoney
        money = self.validateWithdrawMoney(money)
        if money != 0
          @DB.withdrawMoney(@accountId, money, @where)
        end
      when 5
        @GM.sendMoney(@fullname, "")
        email = self.getEmailToSend
        if email != "0"
          system('cls')
          @GM.sendMoney(@fullname, email)
          money = self.getMoney
          money = self.validateWithdrawMoney(money)
          if money != 0
            @DB.sendMoney(@accountId, email, money, @where)
          end
        end
      when 6
        @GM.showTransactions(@fullname, @transactions, @number)
           @number = self.getNumberTransactions
  			if @number != "_"
  				@transactions = @DB.getTransactions(@accountId, @number)
  				@GM.showTransactions(@fullname, @transactions, @number)
  				self.getAnswer
  			end
      when 7
        @state = 4
      when 8
        @state = 5
      when 9
        @state = 6
      end
    when 4
      @GM.mattressMenu(@fullname)
      answer = self.getAnswer
      system('cls')
      case answer
      when 0
        @state = 3
      when 1
        mattressAmount = @DB.getMattressAmount(@accountId)
        @GM.mattressAmount(@fullname, mattressAmount)
        self.getAnswer
      when 2
        @GM.addMoney(@fullname)
        money = self.getMoney
        money = self.validateWithdrawMoney(money)
        if money != 0
          @DB.addMoneyToMattress(@accountId, money)
        end
      when 3
        @GM.withdrawMoney(@fullname)
        money = self.getMoney
        mattressAmount = @DB.getMattressAmount(@accountId)
        while mattressAmount < money && money != 0
          print "The amount is greater than mattress amount."
          money = self.getMoney
        end
        if money != 0
          @DB.withdrawMoneyFromMattress(@accountId, money)
        end
      end
    when 5
      @GM.pocketsMenu(@fullname)
      @pockets = @DB.getPockets(@accountId)
      answer = self.getAnswer
      system('cls')
      case answer
      when 0
        @state = 3
      when 1
        @GM.showPockets(@fullname, @pockets)
        self.getAnswer
      when 2
        @GM.addPocket(@fullname)
        pocketName = self.getPocketName
        if pocketName != "0"
          @DB.addPocket(@accountId, pocketName)
        end
      when 3
        @GM.showPockets(@fullname, @pockets)
        pocketNumber = self.getPocketNumber
        if pocketNumber != 0
          @DB.deletePocket(@accountId, @pockets[pocketNumber-1][0], @pockets[pocketNumber-1][1].to_i)
        end
      when 4
        @GM.showPockets(@fullname, @pockets)
        pocketNumber = self.getPocketNumber
        if pocketNumber != 0
          money = self.getMoney
          if money != 0
            money = self.validateWithdrawMoney(money)
            if money != 0
              @DB.addMoneyToPocket(@accountId, @pockets[pocketNumber-1][0], @pockets[pocketNumber-1][1], money)
            end
          end
        end
      when 5

      when 6

      end
    when 6
      @GM.goalsMenu(@fullname)
      answer = self.getAnswer
      system('cls')
      case answer
      when 0
        @state = 3
      end
    end
    system('cls')
    self.controlMenu
  end

  def getAnswer
    print "\nYour answer: "
    answer = gets.chomp.to_i
    answer = self.validateAnswer(answer)
    return answer
  end

  def getName
    print "\nYour name: "
    @name = gets.chomp
    if @name == "0"
      system('cls')
      @state = 0
    end
    @name = @name.capitalize
  end

  def getLastname
    print "\nYour Lastname: "
    @lastname = gets.chomp
    if @lastname == "0"
      system('cls')
      @state = 0
    end
    @lastname = @lastname.capitalize
  end

  def getEmail
    print "\nYour email: "
    @email = gets.chomp
    if @email == "0"
      system('cls')
      @state = 0
    else
      self.validateEmail
    end
  end

  def getEmailToSend
    print "\nEmail to send money: "
    email = gets.chomp
    return self.validateEmailToSend(email)
  end

  def getPassword
    print "\nYour password: "
    password = gets.chomp
    if password == "0"
      system('cls')
      @state = 0
    else
      @encryptpass = ""
      for i in (1..password.length)
        @encryptpass << "*"
      end
      self.validatePassword(password)
    end
  end

  def getMoney
    print "\nAmount of money: "
    money = gets.chomp.to_i
    money = self.validateMoney(money)
    return money
  end

  def getNumberTransactions
    print "\nHow many transactions do you want to see?: "
    number = gets.chomp.to_i
    number = self.validateTransactionsNumber(number)
    return number
  end

  def getPocketName
    print "\nPocket name: "
    pocketName = gets.chomp
    if pocketName == 0
      return pocketName
    else
      pocketName = self.validatePocketName(pocketName)
    end
    return pocketName
  end

  def getPocketNumber
    print "\nType the number of pocket: "
    pocketNumber = gets.chomp.to_i
    if pocketNumber == 0
      return pocketNumber
    else
      pocketNumber = self.validatePocketNumber(pocketNumber)
    end
    return pocketNumber
  end

  def validatePocketName (pocketName)
    while pocketName != "0" && pocketName.length < 1
      print "\nIncorrect pocket name, try again."
      pocketName = self.getPocketName
    end
    return pocketName
  end

  def validatePocketNumber (pocketNumber)
    while pocketNumber < 0 || pocketNumber > @pockets.length
      print "\nIncorrect number, try again."
      pocketNumber = self.getPocketNumber
    end
    return pocketNumber
  end

  def validateAnswer (answer)
    case @state
    when 0
      while answer < 0 || answer > 2
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
    when 3
      while answer < 0 || answer > 9
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
    when 4
      while answer < 0 || answer > 3
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
    when 5
      while answer < 0 || answer > 6
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
    when 6
      while answer < 0 || answer > 4
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
    end
      return answer
  end

  def validateEmail
    while !(@email.include? "@") || !(@email.include? ".") || @email.length >= 56
      if @email == "0"
        system('cls')
        @state = 0
        break
      else
        print "\nIncorrect email. Your email: "
        @email = gets.chomp
      end
    end
    case @state
    when 1
      if @DB.validateEmail(@email) == false
        print "\nNo account matches that email, try again."
        self.getEmail
      end
    when 2
      if @DB.validateEmail(@email) == true
        print "\nEmail already registered, try again."
        self.getEmail
      end
    end
  end

  def validateEmailToSend (email)
    while !(email.include? "@") || !(email.include? ".") || email.length >= 56
      if email == "0"
        return email
      end
      print "\nIncorrect email. Email to send money: "
      email = gets.chomp
    end
    if @DB.validateEmail(email) == false
      print "\nNo account matches that email, try again."
      email = self.getEmailToSend
    end
    return email
  end

  def validatePassword (password)
    case @state
    when 1
      if @DB.validatePassword(@email, password) == false
        print "\nIncorrect password, try again."
        self.getPassword
      end
    when 2
      @DB.addUser(@name, @lastname, @email, password)
    end
  end

  def validateMoney (money)
    if money < 0
      print "\nIncorrect amount, try again."
      money = self.getMoney
    else
      return money
    end
  end

  def validateWithdrawMoney (money)
    amount = @DB.getAvailableBalance(@accountId)
    while money > amount
      print "\nThe amount is greater than the money available."
      money = self.getMoney
    end
    return money
  end

  def validateTransactionsNumber (number)
    if number == 0
      system('cls')
      @state = 3
      return("_")
    end
    while number < 0
      print "\n It is not a valid argument."
      number = self.getNumberTransactions
    end
    return(number)
  end
end
