class MattressGraphics < Graphics

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
    mattressAmount = mattressAmount.rjust(63)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tMoney saved in your mattress:\t\t\t\t\t|\n"
    print "|#{mattressAmount}\t|\n"
    print @edge + @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end
end
