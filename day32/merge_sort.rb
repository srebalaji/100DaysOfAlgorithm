# Merge Sort

ar = [5,4,7,3,2,1,9]
p ar

def merge_sort(ar)
  sort(ar, 0, ar.length-1)
end

def merge(ar, low, middle, high)
  temp = ar

  mid = middle
  left = low
  right = mid + 1

  current = low
  while (left <= mid) && (right <= high)
    if temp[left] <= temp[right]
      ar[current] = temp[left]
      left += 1
    else
      ar[current] = temp[right]
      right += 1
    end
    current += 1
  end
  remaining = middle - left
  inc = 0
  loop do
    ar[current + inc] = temp[left + inc]
    inc += 1
  end
end

def sort(ar, low, high)
  if low < high
    middle = (low + high)/2
    p ar[middle]
    sort(ar, low, middle)
    sort(ar, middle+1, high)
    merge(ar, low, middle, high)
  end
end

merge_sort(ar)