# Number of ways a kid can reach the floor by considering that the kid can take 1 or 2 or 3 steps.
puts "Enter"
@n = 4
@hash = {}
# def take_steps(n, steps = 1)
# 	# p n - steps
# 	@number += 1 if ((n - steps) == 1 || (n - (steps+1)) == 1 || (n - (steps+2)) == 1)

# 	take_steps(n - steps) if (n - steps) > 0
# 	take_steps(n - (steps+1)) if (n - (steps+1)) > 0
# 	take_steps(n - (steps+2)) if (n - (steps+2)) > 0

# 	# return number
# end



def take_steps(n, steps = 1)
	return 0 if n < 0

	return 1 if n == 0
	return @hash[n] unless @hash[n].nil?
	
	@hash[n] = take_steps(n - 1) + take_steps(n - 2) + take_steps(n - 3)
	return @hash[n]
end

p take_steps(@n)
