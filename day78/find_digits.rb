# Find Digits

# Complete the findDigits function below.
def findDigits(n)
  res = 0
  n.to_s.split("").each do |num|
    num = num.to_i
    if num == 0
      next
    else
      res += 1 if n % num == 0
    end
  end
  res
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    result = findDigits n

    fptr.write result
    fptr.write "\n"
end

fptr.close()
