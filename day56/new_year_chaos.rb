# New year chaos

# ar = [2,1,5,3,4]
ar = [1, 2, 5, 3, 7, 8, 6, 4]
# 1,2,3,4,5,6,7,8
count = 0

# def min_bribes(ar)
# 	count = 0
# 	ar.each_with_index do |element, index|
# 		diff = (index+1) - ar[index]
# 		is_pos = diff > 0 ? true : false
# 		p "#{element} => #{diff}"
# 		if diff.abs > 2 && !is_pos
# 			return "Too chaotic"
# 		end
# 		count += diff.abs if diff < 0
# 	end
# 	return count 
# end

def min_bribes(ar)
	count = 0
	ar.reverse.each_with_index do |element, index|
		if element - index+1 > 2
			return "Too chaotic"
		end

		i = [0, element-2].max
		loop do
			break if i > index
			if ar[i] > element
				count += 1
			end
			i += 1 
		end
	end
	return count
end

puts min_bribes ar