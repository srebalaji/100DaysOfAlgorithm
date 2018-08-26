# Organizing Container

# m[container][type]

def add_type(ball, balls, value)
	if balls.key? ball
		balls[ball] += value
	else
		balls[ball] = value
	end
end

def add_to_cont(c, cont, value)
	if cont.key? c
		cont[c] += value
	else
		cont[c] = value
	end
end

def organize(container)
	cont = {}
	balls = {}

	container.each_with_index do |value, index|
		value.each_with_index do |value2, index2|
			# p "#{index} : #{index2} => #{container[index][index2]}"
			c = index
			type = index2
			add_type(type, balls, container[index][index2])
			add_to_cont(c, cont,  container[index][index2])
		end
	end
	if cont.values.sort == balls.values.sort
		puts "Possible"
	else
		puts "Impossible"
	end
end

organize([[0, 2], [1, 1]])
