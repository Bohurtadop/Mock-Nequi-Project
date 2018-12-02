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
    @DB.updateStatusGoals
    @accountId = @DB.getAccountId(data)
    @fullname = @DB.getFullname(data)
    @goalsGraphics.goalsMenu(@fullname)
    @goals = @DB.getGoals(@accountId)
    @remaining = []
    for i in (0..@goals.length-1)
      if (@goals[i][1] - @goals[i][2]) >= 0
        @remaining << @input.addDots((@goals[i][1] - @goals[i][2]).to_s)
      else
        @remaining << 0
      end
    end
    answer = @input.getAnswer(1, 4)
    system('cls')
    case answer
    when 0
      return 3
    when 1
      @goalsGraphics.showGoals(@fullname, @goals, @remaining)
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
      @goalsGraphics.showGoals(@fullname, @goals, @remaining)
      goalNumber = @input.getGoalNumber(@goals)
      if goalNumber != 0
        @DB.deleteGoal(@accountId, @goals[goalNumber-1][0], @goals[goalNumber-1][2].to_i)
      end
    when 4
      @goalsGraphics.showGoals(@fullname, @goals, @remaining)
      goalNumber = @input.getGoalNumber(@goals)
      if goalNumber != 0
        money = @input.getMoney
        if money != 0
          money = @input.validateWithdrawMoney(@accountId, money)
          if money != 0
            @DB.addMoneyToGoal(@accountId, @goals[goalNumber-1][0], @goals[goalNumber-1][1].to_i, @goals[goalNumber-1][2].to_i, money)
          end
        end
      end
    end
    return 6
  end
end
