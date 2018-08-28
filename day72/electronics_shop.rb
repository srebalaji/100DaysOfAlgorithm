def getMoneySpent(keyboards, drives, b)
  max = nil
  keyboards.sort!
  drives.sort!
  
  k = 0
  d = drives.length - 1
  loop do
    # p k
    break if k == keyboards.length
    d = drives.length - 1
    sum = keyboards[k] + drives[d]
    if sum <= b
      max = sum if max.nil? || max < sum
      # k += 1
    else
      loop do
        d -= 1
        break if d < 0
        sum = keyboards[k] + drives[d]
        if sum <= b
          max = sum if max.nil? || max < sum
          break
        end
      end
    end
    k += 1
  end
  return -1 if max.nil?
  return max
end

p getMoneySpent([3, 1], [5, 2, 8], 10)