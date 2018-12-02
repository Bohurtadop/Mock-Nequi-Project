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

  def showGoals (fullname, goals, remaining)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    if goals.length == 0
      print "|  Your account don't have goals yet.\t\t\t\t\t|\n"
      print @edge
    else
      for i in (0..goals.length-1)
        print "|  #{i+1}. Goal name: #{goals[i][0].to_s.ljust(47)}\t|\n"
        print "|  MONEY: Target: #{@input.addDots(goals[i][1].to_s).ljust(10)}  Saved: #{@input.addDots(goals[i][2].to_s).ljust(10)}  Remaining: #{remaining[i].to_s.ljust(10)}\t|\n"
        print "|  Status: #{goals[i][3].to_s.ljust(13)}      Deadline: #{goals[i][4].to_s[0..18]}\t\t|\n"
        print @edge
      end
    end
    print @edge + @empty
    print "|#{@returnstring}\t|\n"
    print @edge
  end

  def addGoal (fullname, name, targetAmount, deadline)
    fullname = fullname.rjust(40)
    name = name.ljust(46)
    targetAmount = @input.addDots(targetAmount.to_s).ljust(42)
    deadline = deadline.ljust(47)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    print "|\tGoal name: #{name}\t|\n"
    print @edge
    print "|\tTarget amount: #{targetAmount}\t|\n"
    print @edge
    print "|\tDeadline: #{deadline}\t|\n"
    print @edge + @edge + @empty
    print "|#{@exitstring}\t|\n"
    print @edge
  end
end
