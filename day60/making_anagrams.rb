# Making Anagrams


# Complete the makeAnagram function below.
def makeAnagram(a, b)
  count = 0
  hash = {}
  
  a.split("").each do |element|
    if hash.key? element
      hash[element] += 1
    else
      hash[element] = 1
    end
  end
  
  b.split("").each do |element|
    if hash.key? element
      if hash[element] > 1
        hash[element] -= 1
      else
        hash.delete(element)
      end
    else
      count += 1
    end
  end
  count += hash.values.inject(:+)
  count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.to_s.rstrip

b = gets.to_s.rstrip

res = makeAnagram a, b

fptr.write res
fptr.write "\n"

fptr.close()
