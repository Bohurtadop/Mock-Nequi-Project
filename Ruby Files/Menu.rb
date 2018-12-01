load 'Database.rb'
load 'Graphics.rb'
load 'GoalsGraphics.rb'
load 'MattressGraphics.rb'
load 'MenuGraphics.rb'
load 'PocketsGraphics.rb'
load 'TransactionsGraphics.rb'
load 'MattressDatabase.rb'
load 'PocketsDatabase.rb'
load 'TransactionsDatabase.rb'
load 'LoginMenu.rb'
load 'AccountMenu.rb'
load 'PocketsMenu.rb'
load 'GoalsMenu.rb'

class Menu

  def initialize
    @DB = Database.new
    @GM = Graphics.new
    @loginMenu = LoginMenu.new
    @accountMenu = AccountMenu.new
    @pocketsMenu = PocketsMenu.new
    @goalsMenu = GoalsMenu.new
    @goalsGraphics = GoalsGraphics.new
    @mattressGraphics = MattressGraphics.new
    @menuGraphics = MenuGraphics.new
    @pocketsGraphics = PocketsGraphics.new
    @transactionsGraphics = TransactionsGraphics.new
    @mattressDatabase = MattressDatabase.new
    @pocketsDatabase = PocketsDatabase.new
    @transactionsDatabase = TransactionsDatabase.new
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
