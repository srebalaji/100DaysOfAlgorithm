# Palindrome permutation
# Problem Statement

#Given a string, check if its a permutation of a palindrome.

input = "tactcoa"
length = input.length
ha = {}
input.split("").each do |char|
	if ha.key?char
		ha[char] = ha[char] + 1
	else
		ha[char] = 1
	end
end
p ha

if length.even?
	ha.each do |h, v|
		if v % 2 == 0
			ha.delete(h)
		end
	end
	if ha.length == 0
		puts true
	else
		puts false
	end
else
	ha.each do |h, v|
		if v % 2 == 0
			ha.delete(h)
		end
	end
	if ha.length == 1 && (ha.first[1] % 2 != 0)
		puts true
	else
		puts false
	end
end


