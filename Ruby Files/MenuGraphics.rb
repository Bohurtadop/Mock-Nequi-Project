class MenuGraphics < Graphics
  
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
    print "|\t6. Check your latest N transactions.\t\t\t\t|\n"
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
end
