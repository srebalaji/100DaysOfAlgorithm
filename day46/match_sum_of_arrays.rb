# Given two array of integers, swap two numbers so that the sum of two arrays must be same.

ar1 = [4,1,2,1,1,2]
ar2 = [3,6,3,3]

ha1 = {}
ha2 = {}

def add_to_hash_sum_it(arr, ha)
  sum = 0
  arr.each do |ar|
    sum += ar
    if ha.key? ar
      ha[ar] += 1
    else
      ha[ar] = 1
    end
  end
  return sum
end

sum1 = add_to_hash_sum_it(ar1, ha1)
sum2 = add_to_hash_sum_it(ar2, ha2)

diff = (sum1 - sum2).abs

ar1.each do |ar|
  next if ar >= diff
  target = (diff - ar).abs
  if ha2.key? target
    p "#{target} #{ar}"
    break
  end
end

