class GoalsGraphics < Graphics

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

  def showGoals (fullname, goals)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    if goals.length == 0
      print "|  Your account don't have goals yet.\t\t\t\t\t|\n"
      print @edge
    else
      for i in (0..goals.length-1)
        print "|  #{i+1}. Goal name: #{goals[i][0].to_s.ljust(33)}  Total amount: #{goals[i][1].to_s.ljust(9)}\t|\n"
        print "|      Money saved: #{goals[i][2].to_s.ljust(28)}  Remaining money: #{(goals[i][1] - goals[i][2]).to_s.ljust(9)}\t|\n"
        print "|      Status: #{goals[i][3].to_s.ljust(33)}  Deadline: #{goals[i][4].to_s[0..18]}\t|\n"
        print @edge
      end
    end
    print @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end
end
