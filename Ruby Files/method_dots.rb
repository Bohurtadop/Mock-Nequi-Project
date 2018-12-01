def addDots(string_value)
  a = string_value.length.divmod(3)

  if a[1] != 0
    positions = Array(0..a[0]-1).reverse!
  else
    positions = Array(1..a[0]-1).reverse!
  end

  for place in positions do
    string_value = string_value.insert(3*place + a[1] , ".")
  end
  return(string_value)
end
#
# value = "1234567890213124155"
# puts "#{value} \n"
# puts "#{addDots(value)} \n \n"
#
# value = "1"
# puts "#{value} \n"
# puts "#{addDots(value)} \n \n"
#
# value = "100"
# puts "#{value} \n"
# puts "#{addDots(value)} \n \n"
#
# value = "10000"
# puts "#{value} \n"
# puts "#{addDots(value)} \n \n"
#
# value = "100000"
# puts "#{value} \n"
# puts "#{addDots(value)} \n \n"
# value = "100000000000000000000000000000000000000000000000"
# puts "#{value} \n"
# puts "#{addDots(value)} \n \n"
