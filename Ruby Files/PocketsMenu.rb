load 'PocketsDatabase.rb'
load 'PocketsGraphics.rb'
load 'TransactionsGraphics.rb'
load 'InputMenu.rb'

class PocketsMenu

  def initialize
    @transactionsGraphics = TransactionsGraphics.new
    @pocketsDatabase = PocketsDatabase.new
    @pocketsGraphics = PocketsGraphics.new
    @input = InputMenu.new
  end

  def pocketsMenu(data)
    @accountId = @pocketsDatabase.getAccountId(data)
    @fullname = @pocketsDatabase.getFullname(data)
    @pocketsGraphics.pocketsMenu(@fullname)
    @pockets = @pocketsDatabase.getPockets(@accountId)
    answer = @input.getAnswer(1, 6)
    system('cls')
    case answer
    when 0
      return 3
    when 1
      @pocketsGraphics.showPockets(@fullname, @pockets)
      gets.chomp
    when 2
      @pocketsGraphics.addPocket(@fullname)
      pocketName = @input.getPocketName
      if pocketName != "0"
        @pocketsDatabase.addPocket(@accountId, pocketName)
      end
    when 3
      @pocketsGraphics.showPockets(@fullname, @pockets)
      pocketNumber = @input.getPocketNumber(@pockets)
      if pocketNumber != 0
        @pocketsDatabase.deletePocket(@accountId, @pockets[pocketNumber-1][0], @pockets[pocketNumber-1][1].to_i)
      end
    when 4
      @pocketsGraphics.showPockets(@fullname, @pockets)
      pocketNumber = @input.getPocketNumber(@pockets)
      if pocketNumber != 0
        money = @input.getMoney
        if money != 0
          money = @input.validateWithdrawMoney(@accountId, money)
          if money != 0
            @pocketsDatabase.addMoneyToPocket(@accountId, @pockets[pocketNumber-1][0], @pockets[pocketNumber-1][1], money)
          end
        end
      end
    when 5
      @pocketsGraphics.showPockets(@fullname, @pockets)
      pocketNumber = @input.getPocketNumber(@pockets)
      if pocketNumber != 0
        money = @input.getMoney
        if money != 0
          while @pockets[pocketNumber-1][1] < money
            print "The amount is greater than pocket amount."
            money = @input.getMoney
          end
          if money != 0
            @pocketsDatabase.withdrawMoneyFromPocket(@accountId, @pockets[pocketNumber-1][0], @pockets[pocketNumber-1][1], money)
          end
        end
      end
    when 6
      @pocketsGraphics.showPockets(@fullname, @pockets)
      pocketNumber = @input.getPocketNumber(@pockets)
      if pocketNumber != 0
        @where = @pockets[pocketNumber-1][0].to_s
        system('cls')
        @transactionsGraphics.sendMoney(@fullname, "")
        email = @input.getEmailToSend
        if email != "0"
          system('cls')
          @transactionsGraphics.sendMoney(@fullname, email)
          money = @input.getMoney
          while @pockets[pocketNumber-1][1] < money
            print "The amount is greater than pocket amount."
            money = @input.getMoney
          end
          if money != 0
            @pocketsDatabase.sendMoneyFromPocket(@accountId, email, @pockets[pocketNumber-1], money, @where)
          end
        end
      end
    end
    return 5
  end
end
