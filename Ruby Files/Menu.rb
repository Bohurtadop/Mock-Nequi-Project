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
      # @GM.addMoney(@fullname)
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
      @GM.mainMenu(@DB.getFullname(@email))
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
