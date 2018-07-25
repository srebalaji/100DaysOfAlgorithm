# Sort anagrams

arr = ["are", "the", "two", "rea", "owt", "het"]
@ha = {}

def sort_chars(str)
  str.chars.sort.join
end

def anagrams(arr)
  arr.each do |string|
    if @ha.key? sort_chars(string)
      @ha[sort_chars(string)] << string
    else
      @ha[sort_chars(string)] = [string]
    end
  end
end

anagrams(arr)
p @ha
@ha.each do |key, value|
  value.each do |v|
    p v
  end
end