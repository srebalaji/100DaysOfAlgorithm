# Beautiful Days At Movies

def beautifulDays(i, j, k)
  count = 0
  
  (i..j).each do |num|
    rev_num = num.to_s.reverse.to_i
    count += 1 if (rev_num - num)%k == 0
  end
  count
end

p beautifulDays(1, 2000000, 23047885)