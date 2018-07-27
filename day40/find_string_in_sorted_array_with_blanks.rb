# Find string in sorted array with blanks.

str = "zsr"
arr = ["acb", "bcd", "", "", "zsr", "abc"]


def find_str(arr, left, right, str)
  mid_index = (left+right) / 2
  if arr[mid_index].empty?
    inc = 1
    while ((arr[mid_index+inc]).length == 0) && ( (arr[mid_index - inc]).length == 0)
      inc += 1
    end
    mid_index = (arr[mid_index+inc]).length == 0 ? mid_index-inc : mid_index+inc
  end
  return mid_index if str == arr[mid_index]
  if (str <=> arr[mid_index]) == -1
    find_str(arr, left, mid_index-1, str)
  else
    find_str(arr, mid_index + 1, right, str)
  end
end

p find_str(arr, 0, arr.length-1, str)
