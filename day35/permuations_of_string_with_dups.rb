# print permuations of string with duplicate letters.

str = "aab"
p str.length
p (1..str.length).inject(:*)
@arr = []

def print_permutation(string, remaining="")
  if string.length > 1
    ha = []

    string.split("").each do |char|
      next if ha.include?char
      ha << char
      found = false
      rem = string.split("").reject{|c| found = true if !found && c == char}.join
      
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