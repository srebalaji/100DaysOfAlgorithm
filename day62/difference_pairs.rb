# Difference pairs


# Complete the pairs function below.
def pairs(k, arr)
  ha = {}
  pairs = Set.new
  count = 0
  arr.to_set.each do |element|
    ha[element] = 1
  end
  arr.to_set.each do |element|
    sum = (k + element)
    if ha.key? sum
      count += 1
    end
  end
  count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = pairs k, arr

fptr.write result
fptr.write "\n"

fptr.close()
