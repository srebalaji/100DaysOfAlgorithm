# Quick Sort

ar = [1,3,4,2,9,5,10,12]

def partition(ar, left, right)
  pivot = ar[left+right/2]
  while (left <= right)
    while(ar[left] < pivot)
      left += 1
    end
    while(ar[right] > pivot)
      right -= 1
    end
    if left <= right
      ar[left], ar[right] = ar[right], ar[left]
      left += 1
      right -= 1
    end
  end
  left
end

def quick_sort(ar, left, right)
  index = partition(ar, left, right)
  if left < index - 1
    quick_sort(ar, left, index-1)
  end
  if index < right
    quick_sort(ar, index, right)
  end
end

quick_sort(ar, 0, ar.length-1)