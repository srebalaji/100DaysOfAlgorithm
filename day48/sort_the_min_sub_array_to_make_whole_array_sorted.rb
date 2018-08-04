# given an array, sort the minimum sub array to make the whole array sorted.

# arr = [1,2,4,7,10,11,7,12,6,7,16,18,19]
arr = [1,3,2,4,5,6,7]

def from_left(arr)
  inc = 0
  loop do
    if arr[inc] < arr[inc + 1]
      inc += 1 
    else
      break
    end
  end
  [inc, arr[inc]]
end

def from_right(arr)
  inc = arr.length - 1
  loop do
    if arr[inc] > arr[inc - 1]
      inc -= 1 
    else
      break
    end
  end
  [inc, arr[inc]]
end

def get_minimal_element(arr, index)
  element = arr[index]
  inc = index
  loop do
    if arr[inc-1] > element
      inc -= 1
    else
      break
    end
  end
  [inc, arr[inc]]
end

def get_maximum_element(arr, index)
  element = arr[index]
  inc = index
  loop do
    if arr[inc+1] < element
      inc += 1
    else
      break
    end
  end
  [inc, arr[inc]]
end

left_index, get_max_element = from_left(arr)
right_index, get_min_element = from_right(arr)


p get_minimal_element(arr, right_index)
p get_maximum_element(arr, left_index)
