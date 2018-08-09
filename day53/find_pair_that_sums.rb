# Given an array and a sum, find all pairs that sums to the given sum.

ar  =[1,4,5,6,7,1,5,3]

sum = 10
ha  ={}
ar.each do |element|
  if ha.key? (sum - element)
    p "#{element} #{sum - element}"
  else
    ha[element] = 1
  end
end

p ha

