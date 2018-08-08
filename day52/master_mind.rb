# Master mind

solution = "RGBY"

guess = "GGRR"

ha = {}

pseudo = []
hit = []

solution.split("").each_with_index do |char, index|
	if ha.key? char
		ha[char] << index
	else
		ha[char] = [index]
	end
end

guess.split("").each_with_index do |char, index|
	if ha[char].include? index
		hit << char
		pseudo.delete(char) if pseudo.include? char
		next
	end
	if ha.key? char
		pseudo << char unless pseudo.include? char
	end
end

p pseudo
p hit