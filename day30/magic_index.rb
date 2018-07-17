# Find the magic index from the given sorted array.

ar = [-40, -20, -1, 1, 2, 3, 5, 7, 9, 12, 13]
# ar = [-1, 0, 1, 2, 3, 6, 10]
@inc = 0
def find_magic_number(ar, start_index, end_index, length)
  return false if start_index == end_index

  mid_index = length / 2
  mid_index = mid_index + start_index 

  return -1 if mid_index == 0 || mid_index == ar.length-1

  return ar[mid_index] if mid_index == ar[mid_index]

  if mid_index  > ar[mid_index]
    find_magic_number(ar, mid_index+1, ar.length-1, ar[mid_index+1..ar.length-1].length)
  else
    find_magic_number(ar, start_index, mid_index-1, ar[start_index..mid_index-1].length)
  end
end

p find_magic_number(ar, 0, ar.length-1, ar.length)