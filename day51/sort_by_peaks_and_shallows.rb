# Given an array, sort the array by peaks and shallows

arr = [1,2,0]

is_leap = true

inc = 0

loop do
  break if inc >= arr.length

  if is_leap
    unless (inc-1 < 0 || arr[inc-1] < arr[inc]) && (inc+1 >= arr.length || arr[inc+1] < arr[inc])
      arr[inc], arr[inc+1] = arr[inc+1], arr[inc]
    end
  else
    unless (inc-1 < 0 || arr[inc-1] > arr[inc]) && (inc+1 >= arr.length || arr[inc+1] > arr[inc])
      arr[inc], arr[inc+1] = arr[inc+1], arr[inc]
    end
  end
  is_leap = !is_leap
  inc += 1
end

p arr