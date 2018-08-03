# Given an array, find the contiguous sub-sequence with max sum.

arr = [2,-8,3,-2,4,-10]
sum = 0
max_sum = 0

arr.each do |ar|
  sum += ar
  max_sum = sum if sum > max_sum
  sum = 0 if sum < 0
end

p max_sum