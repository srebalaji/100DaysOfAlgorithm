# Find the element from a rotated array.

arr = [15,16,19,20,25,1,3,4,5,7,10,14]
x = 15

def search(arr, left, right, x)
  mid = (left + right) / 2

  return mid if arr[mid] == x

  if arr[mid] < arr[right]
    if (arr[mid+1]..arr[right]).include? x
      search(arr, mid+1, right, x)
    else
      search(arr, left, mid-1, x)
    end
  else
    if (arr[left]..arr[mid-1]).include? x
      search(arr, left, mid-1, x)
    else
      search(arr, mid+1, right, x)
    end
  end
end

p search(arr, 0, arr.length-1, x)