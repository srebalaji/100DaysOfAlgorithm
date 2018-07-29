# Swap numbers without additional space.

ar = [1,3,4,5,6,8,2,60]

def swap_numbers(ar, index1, index2)
  ar[index1] = (ar[index1] - ar[index2]).abs
  ar[index2] = (ar[index1] - ar[index2]).abs
  ar[index1] = ar[index1] + ar[index2]
end

swap_numbers(ar, 6, 7)

p ar