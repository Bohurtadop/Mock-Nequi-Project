load 'LoginDatabase.rb'

class InputMenu

  def initialize
    @DB = LoginDatabase.new
  end

  def getAnswer(min, max)
    print "\nYour answer: "
    answer = gets.chomp.to_i
    return self.validateAnswer(answer, min, max)
  end

  def getName
    print "\nYour name: "
    name = gets.chomp
    if name == "0"
      system('cls')
      return 0
    end
    name = name.capitalize
    return name
  end

  def getLastname
    print "\nYour Lastname: "
    lastname = gets.chomp
    if lastname == "0"
      system('cls')
      return 0
    end
    lastname = lastname.capitalize
    return lastname
  end

  def getEmail
    print "\nYour email: "
    email = gets.chomp
    if email == "0"
      system('cls')
      return 0
    else
      return email
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
      return 0
    else
      return password
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

  def getPocketNumber (pockets)
    print "\nType the number of pocket: "
    pocketNumber = gets.chomp.to_i
    if pocketNumber == 0
      return pocketNumber
    else
      pocketNumber = self.validatePocketNumber(pocketNumber, pockets)
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

  def validatePocketNumber (pocketNumber, pockets)
    while pocketNumber < 0 || pocketNumber > pockets.length
      print "\nIncorrect number, try again."
      pocketNumber = self.getPocketNumber(pockets)
    end
    return pocketNumber
  end

  def validateAnswer (answer, min, max)
      while answer < min || answer > max
        if answer == 0
          return 0
        end
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
      return answer
  end

  def validateEmail(email)
    while !(email.include? "@") || !(email.include? ".") || email.length >= 56
      if email == "0"
        system('cls')
        return 0
        break
      else
        print "\nIncorrect email. Your email: "
        email = gets.chomp
      end
    end
    return email
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

  def validateMoney (money)
    if money < 0
      print "\nIncorrect amount, try again."
      money = self.getMoney
    else
      return money
    end
  end

  def validateWithdrawMoney (accountId, money)
    amount = @DB.getAvailableBalance(accountId)
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
      return number
    end
    while number < 0
      print "\nIt is not a valid argument."
      number = self.getNumberTransactions
    end
    return number
  end
end
