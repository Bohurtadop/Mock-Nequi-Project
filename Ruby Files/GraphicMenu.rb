class GraphicMenu
  def initialize
    @edge = "+-----------------------------------------------------------------------+\n"
    @empty = "|\t\t\t\t\t\t\t\t\t|\n"
    @mocknequi = "MOCK NEQUI".center(71)
    @exitstring = "Enter 0 to exit".rjust(63)
    @signoutstring = "Enter 0 to sign out.".rjust(63)
    @returnstring = "Enter 0 to return to main menu.".rjust(63)
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
    print "|\t5. Send money to other account.\t\t\t\t\t|\n"
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
    availableBalance = availableBalance.rjust(63)
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
    totalBalance = totalBalance.rjust(63)
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
    print "|\tAdd money to your account:\t\t\t\t\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end
end
