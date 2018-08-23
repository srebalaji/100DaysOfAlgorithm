# Ice Cream Parlour

# Complete the whatFlavors function below.
def whatFlavors(cost, money)
  ha = {}
  
cost.each_with_index do |value, index|
  # p "#{index} => #{money} #{money-index}"
  if ha.key? (money-value)
    # p "#{index} => #{money} #{money-index} value = #{value} and #{ha[money-index]}"
    arr = [index+1, ha[money-value]].sort
    puts "#{arr[0]} #{arr[1]}"
    # puts "#{value} #{money-value}"
    return
  else
    ha[value] = index+1
  end
end

end

t = gets.to_i

t.times do |t_itr|
    money = gets.to_i

    n = gets.to_i

    cost = gets.rstrip.split(' ').map(&:to_i)

    whatFlavors cost, money
end
