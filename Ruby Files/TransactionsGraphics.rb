class TransactionsGraphics < Graphics

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
    print "|#{@exitstring}\t|\n"
    print @edge
  end

  def showTransactions (fullname, transactions)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    if transactions.length == 0
      print "|  Your account don't have transactions yet.\t\t\t\t|\n"
      print @edge
    else
      for i in (0..transactions.length-1)
        print "|  #{i+1}. Date: #{transactions[i][0].to_s[0..18]}    Type: #{transactions[i][1].to_s}  Amount: #{transactions[i][2].to_s.ljust(9)}\t|\n"
        print "|  User: #{transactions[i][3].to_s.ljust(25)} From/To: #{transactions[i][4].to_s.ljust(27)}\t|\n"
        print @edge
      end
    end
    print @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end
end
