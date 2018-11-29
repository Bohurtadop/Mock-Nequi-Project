class GraphicMenu
  def initialize
    @edge = "+-----------------------------------------------------------------------+\n"
    @empty = "|\t\t\t\t\t\t\t\t\t|\n"
    @mocknequi = "MOCK NEQUI".center(71)
    @exitstring = "Enter 0 to exit".rjust(63)
    @signoutstring = "Enter 0 to sign out.".rjust(63)
    @returnstring = "Press enter to return to main menu.".rjust(63)
  end

  def homeScreen
    print @edge + @empty
    print "|#{@mocknequi}|\n"
    print @empty + @edge + @edge
    print "|\t1. Sign in.\t\t\t\t\t\t\t|\n"
    print @edge
    print "|\t2. Sign up.\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end

  def signIn (email, encryptpass)
    emailstring = email.ljust(49)
    passstring = encryptpass.ljust(46)
    print @edge + @empty
    print "|#{@mocknequi}|\n"
    print @empty + @edge + @edge
    print "|\tEmail: #{emailstring}\t|\n"
    print @edge
    print "|\tPassword: #{passstring}\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end

  def signUp (name, lastname, email, encryptpass)
    namestring = name.ljust(50)
    lastnamestring = lastname.ljust(47)
    emailstring = email.ljust(49)
    passstring = encryptpass.ljust(46)
    print @edge + @empty
    print "|#{@mocknequi}|\n"
    print @empty + @edge + @edge
    print "|\tName: #{namestring}\t|\n"
    print @edge
    print "|\tLastame: #{lastnamestring}\t|\n"
    print @edge
    print "|\tEmail: #{emailstring}\t|\n"
    print @edge
    print "|\tPassword: #{passstring}\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end

  def mainMenu (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\t1. Check the available balance in your account.\t\t\t|\n"
    print @edge
    print "|\t2. Check the total balance in your account.\t\t\t|\n"
    print @edge
    print "|\t3. Add money to your account.\t\t\t\t\t|\n"
    print @edge
    print "|\t4. Withdraw money from your account.\t\t\t\t|\n"
    print @edge
    print "|\t5. Send money to another user.\t\t\t\t\t|\n"
    print @edge
    print "|\t6. Check your latest 10 transactions.\t\t\t\t|\n"
    print @edge
    print "|\t7. Mattress menu.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t8. Pockets menu.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t9. Goals menu.\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@signoutstring}\t|\n"
    print @edge
  end

  def availableBalance (fullname, availableBalance)
    fullname = fullname.rjust(40)
    availableBalance = availableBalance.to_s.rjust(63)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tAvailable balance in your account:\t\t\t\t|\n"
    print "|#{availableBalance}\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def totalBalance (fullname, totalBalance)
    fullname = fullname.rjust(40)
    totalBalance = totalBalance.to_s.rjust(63)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tTotal balance in your account:\t\t\t\t\t|\n"
    print "|#{totalBalance}\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def addMoney (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tAdd money:\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def withdrawMoney (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tWithdraw money:\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def sendMoney (fullname, email)
    emailstring = email.ljust(49)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tSend money to another account:\t\t\t\t\t|\n"
    print @edge
    print "|\tEmail: #{emailstring}\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def showTransactions (fullname, transactions)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    for i in (0..transactions.length-1)
      print "|  #{i+1}. Date: #{transactions[i][0].to_s[0..18]}    Type: #{transactions[i][1].to_s}  Amount: #{transactions[i][2].to_s}\t|\n"
      print "|  User: #{transactions[i][3].to_s.ljust(25)} From/To: #{transactions[i][4].to_s.ljust(27)}\t|\n"
      print @edge
    end
    print @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def showPockets (fullname, pockets)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    for i in (0..pockets.length-1)
      print "|  #{i+1}. Pocket name: #{pockets[i][0].to_s.ljust(33)}  Amount: #{pockets[i][1].to_s.ljust(9)}\t|\n"
      print @edge
    end
    print @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def mattressMenu (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tMATTRESS MENU:\t\t\t\t\t\t\t|\n"
    print @edge
    print "|\t1. Check the money saved in your mattress.\t\t\t|\n"
    print @edge
    print "|\t2. Add available money to your mattress.\t\t\t|\n"
    print @edge
    print "|\t3. Withdraw money from your mattress.\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end

  def mattressAmount (fullname, mattressAmount)
    fullname = fullname.rjust(40)
    mattressAmount = mattressAmount.to_s.rjust(63)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tMoney saved in your mattress:\t\t\t\t\t|\n"
    print "|#{mattressAmount}\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def pocketsMenu (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tPOCKETS MENU:\t\t\t\t\t\t\t|\n"
    print @edge
    print "|\t1. Check pockets information.\t\t\t\t\t|\n"
    print @edge
    print "|\t2. Create new pocket.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t3. Delete pocket.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t4. Add money to a pocket.\t\t\t\t\t|\n"
    print @edge
    print "|\t5. Withdraw money from a pocket.\t\t\t\t|\n"
    print @edge
    print "|\t6. Send money to another user.\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end

  def addPocket (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tAdd pocket:\t\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def goalsMenu (fullname)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tGOALS MENU:\t\t\t\t\t\t\t|\n"
    print @edge
    print "|\t1. Check goals information.\t\t\t\t\t|\n"
    print @edge
    print "|\t2. Create new goal.\t\t\t\t\t\t|\n"
    print @edge
    print "|\t3. Delete goal.\t\t\t\t\t\t\t|\n"
    print @edge
    print "|\t4. Add money to a goal.\t\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end
end
