# Print permutations of the given string
str = "abcde"
p str.length
p (1..str.length).inject(:*)
@arr = []

def print_permutation(string, remaining="")
  if string.length > 1
    string.split("").each do |char|
      rem = string.split("").reject{|c| c == char}.join
      
      print_permutation(rem, "#{remaining}#{char}")
    end
  else
    string = "#{remaining}#{string}"
    @arr << string
    p string
  end
end
print_permutation(str)
p @arr.count
