s1 = "waterbottle"
s2 = "erbottlewat"

ha = {}

s1.split("").each_with_index do |char, index|
	if ha.key?char
		arr = ha[char]
		arr << index
		ha[char] = arr
	else
		ha[char] = [index]
	end
end

puts ha

prev = nil
flag = nil

s2.split("").each_with_index do |char, index|
	break_outer = nil
	if prev.nil?
		prev = ha[char]
	else
		current = ha[char]
		# p prev
		# p current
		# p "------"
		current.each do |ch|
			if prev.include?(ch-1) || prev.include?(s2.length-1)
				prev = current
				break_outer = 1
				break
			end
		end
		if break_outer.nil?
			puts "Not a match"
			flag = 1
			break
		else
			next
		end
	end
end
if flag.nil?
	puts "Its a match"
end