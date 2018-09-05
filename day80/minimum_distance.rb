# Minimum Distance

def minimumDistances(a)
	ha = {}
	min = nil

	a.each_with_index do |element, index|
		if ha.key? element
			diff = (index - ha[element]).abs
			min = diff if min.nil? || min > diff
			ha[element] = index
		else
			ha[element] = index
		end
	end
	# p ha
	min || -1
end

p minimumDistances([1, 2, 3, 4, 10])