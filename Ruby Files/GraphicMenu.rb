class GraphicMenu
  def initialize
    @edge = "+-----------------------------------------------------------------------+\n"
    @empty = "|\t\t\t\t\t\t\t\t\t|\n"
    @mocknequi = "MOCK NEQUI".center(71)
    @exitstring = "Enter 0 to exit".rjust(63)
    @closeSession = "Enter 0 to sign out.".rjust(63)
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
    print "|\t3. Enter money to your account.\t\t\t\t\t|\n"
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
    print "|#{@closeSession}\t|\n"
    print @edge
  end

end
