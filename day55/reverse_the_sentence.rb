# Reverse the sentence

ar = "Rails is one of the best web frameworks"
reverse_ar = ""

inc = ar.length-1

check_space = proc { |index| ar[index] == " "}

loop do
	break if inc < 0
	if ar[inc] == " " || inc == 0
		char_inc = check_space.call(inc) ? inc+1 : inc
		while char_inc < ar.length && ar[char_inc] != " "
			reverse_ar += ar[char_inc]
			char_inc += 1
		end
		reverse_ar += " " if check_space.call(inc)
	end
	inc -= 1
end

p ar
p reverse_ar