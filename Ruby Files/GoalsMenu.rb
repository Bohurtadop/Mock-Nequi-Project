load 'GoalsGraphics.rb'
load 'GoalsDatabase.rb'
load 'InputMenu.rb'

class GoalsMenu

  def initialize
    @goalsGraphics = GoalsGraphics.new
    @DB = GoalsDatabase.new
    @input = InputMenu.new
  end

  def goalsMenu(data)
    @accountId = @DB.getAccountId(data)
    @fullname = @DB.getFullname(data)
    @goalsGraphics.goalsMenu(@fullname)
    @goals = @DB.getGoals(@accountId)
    answer = @input.getAnswer(1, 4)
    system('cls')
    case answer
    when 0
      return 3
    when 1
      @goalsGraphics.showGoals(@fullname, @goals)
      gets.chomp
    end
    return 6
  end
end
