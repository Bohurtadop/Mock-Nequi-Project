load 'LoginMenu.rb'
load 'AccountMenu.rb'
load 'PocketsMenu.rb'
load 'GoalsMenu.rb'

class Menu

  def initialize
    @loginMenu = LoginMenu.new
    @accountMenu = AccountMenu.new
    @pocketsMenu = PocketsMenu.new
    @goalsMenu = GoalsMenu.new
    # STATE means which menu is active. 0: Home screen, 1: Sign in, 2: Sign up, 3: Main menu
    @state = 0
    self.controlMenu
  end

  def controlMenu
    case @state
    when 0
      @state = @loginMenu.homeScreen
    when 1
      @data = @loginMenu.signIn
      if @data == 0
        @state = 0
      else
        @state = 3
      end
    when 2
      @data = @loginMenu.signUp
      if @data == 0
        @state = 0
      else
        @state = 3
      end
    when 3
      @state = @accountMenu.mainMenu(@data)
    when 4
      @state = @accountMenu.mattressMenu
    when 5
      @state = @pocketsMenu.pocketsMenu(@data)
    when 6
      @state = @goalsMenu.goalsMenu(@data)
    end
    system('cls')
    self.controlMenu
  end
end
