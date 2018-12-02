load 'MenuGraphics.rb'
load 'InputMenu.rb'
load 'TransactionsDatabase.rb'
load 'TransactionsGraphics.rb'
load 'MattressDatabase.rb'
load 'MattressGraphics.rb'

class AccountMenu

  def initialize
    @DB = TransactionsDatabase.new
    @menuGraphics = MenuGraphics.new
    @transactionsGraphics = TransactionsGraphics.new
    @input = InputMenu.new
    @mattressDatabase = MattressDatabase.new
    @mattressGraphics = MattressGraphics.new
  end

  def mainMenu(data)
    @where = 'Available balance'
    @accountId = @DB.getAccountId(data)
    @fullname = @DB.getFullname(data)
    @menuGraphics.mainMenu(@fullname)
    answer = @input.getAnswer(1, 9)
    system('cls')
    case answer
    when 0
      return 0
    when 1
      availableBalance = @DB.getAvailableBalance(@accountId)
      availableBalance = @input.addDots(availableBalance.to_s)
      @menuGraphics.availableBalance(@fullname, availableBalance)
      gets.chomp
    when 2
      totalBalance = @DB.getTotalBalance(@accountId)
      totalBalance = @input.addDots(totalBalance.to_s)
      @menuGraphics.totalBalance(@fullname, totalBalance)
      gets.chomp
    when 3
      @transactionsGraphics.addMoney(@fullname)
      money = @input.getMoney
      if money != 0
        @DB.addMoney(@accountId, money)
      end
    when 4
      @transactionsGraphics.withdrawMoney(@fullname)
      money = @input.getMoney
      money = @input.validateWithdrawMoney(@accountId, money)
      if money != 0
        @DB.withdrawMoney(@accountId, money, @where)
      end
    when 5
      @transactionsGraphics.sendMoney(@fullname, "")
      email = @input.getEmailToSend
      if email != "0"
        system('cls')
        @transactionsGraphics.sendMoney(@fullname, email)
        money = @input.getMoney
        money = @input.validateWithdrawMoney(@accountId, money)
        if money != 0
          @DB.sendMoney(@accountId, email, money, @where)
        end
      end
    when 6
      @menuGraphics.mainMenu(@fullname)
      number = @input.getNumberTransactions
      if @number != 0
        system('cls')
        @transactionsGraphics.showTransactions(@fullname, @DB.getTransactions(@accountId, number))
        gets.chomp
      end
    when 7
      return 4
    when 8
      return 5
    when 9
      return 6
    end
    return 3
  end

  def mattressMenu
    @mattressGraphics.mattressMenu(@fullname)
    answer = @input.getAnswer(1, 3)
    system('cls')
    case answer
    when 0
      return 3
    when 1
      mattressAmount = @mattressDatabase.getMattressAmount(@accountId)
      mattressAmount = @input.addDots(mattressAmount.to_s)
      @mattressGraphics.mattressAmount(@fullname, mattressAmount)
      gets.chomp
    when 2
      @transactionsGraphics.addMoney(@fullname)
      money = @input.getMoney
      money = @input.validateWithdrawMoney(@accountId, money)
      if money != 0
        @mattressDatabase.addMoneyToMattress(@accountId, money)
      end
    when 3
      @transactionsGraphics.withdrawMoney(@fullname)
      money = @input.getMoney
      mattressAmount = @mattressDatabase.getMattressAmount(@accountId)
      while mattressAmount < money && money != 0
        print "The amount is greater than mattress amount."
        money = @input.getMoney
      end
      if money != 0
        @mattressDatabase.withdrawMoneyFromMattress(@accountId, money)
      end
    end
    return 4
  end
end
