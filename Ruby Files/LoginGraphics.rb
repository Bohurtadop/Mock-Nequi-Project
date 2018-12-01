class LoginGraphics < Graphics
  
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
end
