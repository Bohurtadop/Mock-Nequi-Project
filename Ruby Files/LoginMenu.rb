load 'LoginGraphics.rb'
load 'LoginDatabase.rb'
load 'InputMenu.rb'

class LoginMenu

  def initialize
    @loginGraphics = LoginGraphics.new
    @loginDatabase = LoginDatabase.new
    @input = InputMenu.new
  end

  def homeScreen
    @email = ""
    @encryptpass = ""
    @name = ""
    @lastname = ""
    @loginGraphics.homeScreen
    answer = @input.getAnswer(1, 2)
    case answer
    when 0
      system('cls')
      print "Exit sucesfully."
      system(exit)
    when 1
      return 1
    when 2
      return 2
    end
  end

  def signIn
    @loginGraphics.signIn(@email, @encryptpass)
    email = @input.getEmail
    if email != 0
      email = @input.validateEmail(email)
      if email != 0
        while @loginDatabase.validateEmail(email) == false
          print "\nNo account matches that email, try again."
          email = @input.getEmail
          if email == 0
            return 0
          end
        end
        system('cls')
        @loginGraphics.signIn(email, @encryptpass)
        password = @input.getPassword
        if password != 0
          while @loginDatabase.validatePassword(email, password) == false
            print "\nIncorrect password, try again."
            password = @input.getPassword
            if password == 0
              return 0
            end
          end
          return email
        end
      end
    end
    return 0
  end

  def signUp
    @loginGraphics.signUp(@name, @lastname, @email, @encryptpass)
    name = @input.getName
    if name != 0
      system('cls')
      @loginGraphics.signUp(name, @lastname, @email, @encryptpass)
      lastname = @input.getLastname
      if lastname != 0
        system('cls')
        @loginGraphics.signUp(name, lastname, @email, @encryptpass)
        email = @input.getEmail
        if email != 0
          email = @input.validateEmail(email)
          if email != 0
            while @loginDatabase.validateEmail(email) == true
              print "\nEmail already registered, try again."
              email = @input.getEmail
              if email == 0
                return 0
              end
            end
            system('cls')
            @loginGraphics.signUp(name, lastname, email, @encryptpass)
            password = @input.getPassword
            if password != 0
              @loginDatabase.addUser(name, lastname, email, password)
              return email
            end
          end
        end
      end
    end
    return 0
  end
end
