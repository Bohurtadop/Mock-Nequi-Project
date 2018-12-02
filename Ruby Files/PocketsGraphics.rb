class PocketsGraphics < Graphics

  def showPockets (fullname, pockets)
    fullname = fullname.rjust(40)
    print @edge + @empty
    print "|\tMOCK NEQUI\t#{fullname}\t|\n"
    print @empty + @edge + @edge
    if pockets.length == 0
      print "|  Your account don't have pockets yet.\t\t\t\t\t|\n"
      print @edge
    else
      for i in (0..pockets.length-1)
        print "|  #{i+1}. Pocket name: #{pockets[i][0].to_s.ljust(33)}  Amount: #{@input.addDots(pockets[i][1].to_s).ljust(9)}\t|\n"
        print @edge
      end
    end
    print @edge + @empty
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
    print "|#{@exitstring}\t|\n"
    print @edge
  end
end
