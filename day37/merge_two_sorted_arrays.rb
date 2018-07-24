# Merge two sorted arrays.

a1 = [1,3,5,7,10]
a2 = [2,4,6,8,9,11]

inc = a1.length-1

a1[a1.length + a2.length-1] = nil
a1_inc = a1.length-1
a2_inc = a2.length-1

# loop do
#   value = a2[a2_inc]
#   if a1[inc] > value
#     inc -= 1
#   else
#     a1 = a1[0..inc] + [value] + a1[inc+1..a1.length-1]
#     a2_inc -= 1
#   end
#   break if a2_inc < 0
# end
# p a1
p a1
loop do
  break if a2_inc < 0
  value = a2[a2_inc]
  if a1[inc] > value
    a1[a1_inc] = a1[inc]
    inc -= 1
  else
    a1[a1_inc] = value
    a2_inc -= 1
  end
  a1_inc -= 1
end
p a1