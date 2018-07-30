# Find minimum difference from two given arrays.

a1 = [1,3,15,11,2]
a2 = [23,127,235,19,8]

a1.sort!
a2.sort!

p a1
p a2

inc = 0
inc2 = 0
min = nil
loop do
  break if inc == a1.length-1 || inc2 == a2.length-1

  if a1[inc] < a2[inc2]
    inc += 1
  else
    diff = a1[inc] - a2[inc2]
    min = diff if (min.nil? || diff < min )
    inc2 += 1
  end
end

p min