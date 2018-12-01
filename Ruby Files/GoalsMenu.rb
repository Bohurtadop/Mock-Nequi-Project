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
    when 2
      @goalsGraphics.addGoal(@fullname, "", "", "")
      goalName = @input.getGoalName
      if goalName != "0"
        system('cls')
        @goalsGraphics.addGoal(@fullname, goalName, "", "")
        targetAmount = @input.getMoney
        if targetAmount != 0
          system('cls')
          @goalsGraphics.addGoal(@fullname, goalName, targetAmount.to_s, "")
          deadline = @input.getDeadline
          if deadline != 0
            system('cls')
            @DB.addGoal(@accountId, goalName, targetAmount.to_s, deadline)
          end
        end
      end
    when 3
      @goalsGraphics.showGoals(@fullname, @goals)
      goalNumber = @input.getGoalNumber(@goals)
      if goalNumber != 0
        @DB.deleteGoal(@accountId, @goals[goalNumber-1][0], @goals[goalNumber-1][2].to_i)
      end
    when 4
      @goalsGraphics.showGoals(@fullname, @goals)
      goalNumber = @input.getGoalNumber(@goals)
      if goalNumber != 0
        money = @input.getMoney
        if money != 0
          money = @input.validateWithdrawMoney(@accountId, money)
          if money != 0
            @DB.addMoneyToGoal(@accountId, @goals[goalNumber-1][0], @goals[goalNumber-1][2], money)
          end
        end
      end
    end
    return 6
  end
end
