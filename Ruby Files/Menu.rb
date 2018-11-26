load 'Database.rb'

class Menu

  def initialize
    @DB = Database.new
    # STATE means which menu is active. 0: Home screen, 1: Sign in, 2: Sign up, 3: Main menu
    @state = 0
    @edge = "+-----------------------------------------------------------------------+\n"
    @empty = "|\t\t\t\t\t\t\t\t\t|\n"
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
      self.homeScreen
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
      self.signIn
      self.getEmail
      if @state == 1
        system('cls')
        self.signIn
        self.getPassword
        @fullname = @DB.getFullname(@email)
        @state = 3
      end
    when 2
      self.signUp
      self.getName
      if @state == 2
        system('cls')
        self.signUp
        self.getLastname
        if @state == 2
          system('cls')
          self.signUp
          self.getEmail
          if @state == 2
            system('cls')
            self.signUp
            self.getPassword
            @state = 3
          end
        end
      end
    when 3
      self.mainMenu
      answer = self.getAnswer
      case answer
      when 0
        system('cls')
        @state = 0
      end
    end
    system('cls')
    self.controlMenu
  end

  def homeScreen
    print @edge + @empty
    print "|\t\t\t\tMOCK NEQUI\t\t\t\t|\n"
    print @empty + @edge + @edge
    print "|\t1. Sign in.\t\t\t\t\t\t\t|\n"
    print @edge
    print "|\t2. Sign up.\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|\t\t\t\t\t\tEnter 0 to exit.\t|\n"
    print @edge
  end

  def signIn
    print @edge + @empty
    print "|\t\t\t\tMOCK NEQUI\t\t\t\t|\n"
    print @empty + @edge + @edge
    if @email.length < 1
      print "|\tEmail: "+@email+"\t\t\t\t\t\t\t\t|\n"
    elsif @email.length < 9
      print "|\tEmail: "+@email+"\t\t\t\t\t\t\t|\n"
    elsif @email.length < 17
      print "|\tEmail: "+@email+"\t\t\t\t\t\t|\n"
    elsif @email.length < 25
      print "|\tEmail: "+@email+"\t\t\t\t\t|\n"
    elsif @email.length < 33
      print "|\tEmail: "+@email+"\t\t\t\t|\n"
    elsif @email.length < 41
      print "|\tEmail: "+@email+"\t\t\t|\n"
    elsif @email.length < 49
      print "|\tEmail: "+@email+"\t\t|\n"
    elsif @email.length < 57
      print "|\tEmail: "+@email+"\t|\n"
    else
      print "| Email: "+@email+"\t|\n"
    end
    print @edge
    if @encryptpass.length < 6
      print "|\tPassword: "+@encryptpass+"\t\t\t\t\t\t\t|\n"
    elsif @encryptpass.length < 14
      print "|\tPassword: "+@encryptpass+"\t\t\t\t\t\t|\n"
    elsif @encryptpass.length < 22
      print "|\tPassword: "+@encryptpass+"\t\t\t\t\t|\n"
    elsif @encryptpass.length < 30
      print "|\tPassword: "+@encryptpass+"\t\t\t\t|\n"
    elsif @encryptpass.length < 38
      print "|\tPassword: "+@encryptpass+"\t\t\t|\n"
    elsif @encryptpass.length < 46
      print "|\tPassword: "+@encryptpass+"\t\t|\n"
    elsif @encryptpass.length < 54
      print "|\tPassword: "+@encryptpass+"\t|\n"
    else
      print "| Password: "+@encryptpass+"\t|\n"
    end
    print @edge + @edge + @empty
    print "|\t\t\t\t\t\tEnter 0 to exit.\t|\n"
    print @edge
  end

  def signUp
    print @edge + @empty
    print "|\t\t\t\tMOCK NEQUI\t\t\t\t|\n"
    print @empty + @edge + @edge
    if @name.length < 2
      print "|\tName: "+@name+"\t\t\t\t\t\t\t\t|\n"
    elsif @name.length < 10
      print "|\tName: "+@name+"\t\t\t\t\t\t\t|\n"
    elsif @name.length < 18
      print "|\tName: "+@name+"\t\t\t\t\t\t|\n"
    elsif @name.length < 26
      print "|\tName: "+@name+"\t\t\t\t\t|\n"
    elsif @name.length < 34
      print "|\tName: "+@name+"\t\t\t\t|\n"
    elsif @name.length < 42
      print "|\tName: "+@name+"\t\t\t|\n"
    elsif @name.length < 50
      print "|\tName: "+@name+"\t\t|\n"
    elsif @name.length < 58
      print "|\tName: "+@name+"\t|\n"
    else
      print "| Name: "+@name+"\t|\n"
    end
    print @edge
    if @lastname.length < 6
      print "|\tLastame: "+@lastname+"\t\t\t\t\t\t\t|\n"
    elsif @lastname.length < 14
      print "|\tLastame: "+@lastname+"\t\t\t\t\t\t|\n"
    elsif @lastname.length < 22
      print "|\tLastame: "+@lastname+"\t\t\t\t\t|\n"
    elsif @lastname.length < 30
      print "|\tLastame: "+@lastname+"\t\t\t\t|\n"
    elsif @lastname.length < 38
      print "|\tLastame: "+@lastname+"\t\t\t|\n"
    elsif @lastname.length < 46
      print "|\tLastame: "+@lastname+"\t\t|\n"
    elsif @lastname.length < 54
      print "|\tLastame: "+@lastname+"\t|\n"
    else
      print "| tLastame: "+@lastname+"\t|\n"
    end
    print @edge
    if @email.length < 1
      print "|\tEmail: "+@email+"\t\t\t\t\t\t\t\t|\n"
    elsif @email.length < 9
      print "|\tEmail: "+@email+"\t\t\t\t\t\t\t|\n"
    elsif @email.length < 17
      print "|\tEmail: "+@email+"\t\t\t\t\t\t|\n"
    elsif @email.length < 25
      print "|\tEmail: "+@email+"\t\t\t\t\t|\n"
    elsif @email.length < 33
      print "|\tEmail: "+@email+"\t\t\t\t|\n"
    elsif @email.length < 41
      print "|\tEmail: "+@email+"\t\t\t|\n"
    elsif @email.length < 49
      print "|\tEmail: "+@email+"\t\t|\n"
    elsif @email.length < 57
      print "|\tEmail: "+@email+"\t|\n"
    else
      print "| Email: "+@email+"\t|\n"
    end
    print @edge
    if @encryptpass.length < 6
      print "|\tPassword: "+@encryptpass+"\t\t\t\t\t\t\t|\n"
    elsif @encryptpass.length < 14
      print "|\tPassword: "+@encryptpass+"\t\t\t\t\t\t|\n"
    elsif @encryptpass.length < 22
      print "|\tPassword: "+@encryptpass+"\t\t\t\t\t|\n"
    elsif @encryptpass.length < 30
      print "|\tPassword: "+@encryptpass+"\t\t\t\t|\n"
    elsif @encryptpass.length < 38
      print "|\tPassword: "+@encryptpass+"\t\t\t|\n"
    elsif @encryptpass.length < 46
      print "|\tPassword: "+@encryptpass+"\t\t|\n"
    elsif @encryptpass.length < 54
      print "|\tPassword: "+@encryptpass+"\t|\n"
    else
      print "| Password: "+@encryptpass+"\t|\n"
    end
    print @edge + @edge + @empty
    print "|\t\t\t\t\t\tEnter 0 to exit.\t|\n"
    print @edge
  end

  def mainMenu
    @fullname = @fullname.rjust(47)
    print @edge + @empty
    print "|\tMOCK NEQUI #{@fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\t1. Check the available balance in your account.\t\t\t|\n"
    print @edge
    print "|\t2. Check the total balance in your account.\t\t\t|\n"
    print @edge
    print "|\t3. Enter money to your account.\t\t\t\t\t|\n"
    print @edge
    print "|\t4. Withdraw money from your account.\t\t\t\t|\n"
    print @edge
    print "|\t5. Send money to other account.\t\t\t\t\t|\n"
    print @edge
    print "|\t6. Check your latest 10 transactions.\t\t\t\t|\n"
    print @edge
    print "|\t7. Mattress menu.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t8. Pockets menu.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t9. Goals menu.\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|\t\t\t\t\tEnter 0 to close session.\t|\n"
    print @edge
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
    @name.capitalize
  end

  def getLastname
    print "\nYour Lastname: "
    @lastname = gets.chomp
    if @lastname == "0"
      system('cls')
      @state = 0
    end
    @lastname.capitalize
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

  def validateAnswer(answer)
    case @state
    when 0
      while answer < 0 || answer > 2
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
      return answer
    when 3
      while answer < 0 || answer > 9
        print "\nIncorrect answer. Your answer: "
        answer = gets.chomp.to_i
      end
      return answer
    end
  end

  def validateEmail
    while !(@email.include? "@") || !(@email.include? ".") || @email.length >= 56
      if @email == "0"
        system('cls')
        @state = 0
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

  def validatePassword(password)
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
end
