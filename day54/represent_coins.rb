# Given the infinite number of 1,5,10,25 cents, print number of ways you can represent the target cents.

target = 10
ar = [1,5,10,25]



def get_count(ar, length, target)
  return 1 if target == 0
  return 0 if target < 0
  return 0 if length <= 0 && target >= 1
  return get_count(ar, length-1, target) + get_count(ar, length, target-ar[length-1])
end

p get_count(ar, ar.length, target)