# Given the array, find the max stock you can buy.

ar = [10, 22, 5, 75, 65, 80]

small = 1000
diff = 0
max_stock = 0

ar.each do |element|
  if element < small
    small = element
  end
  
  if diff < (element - small)
    diff = element - small
    max_stock = element
  end
end

p small
p max_stock
p max_stock - small