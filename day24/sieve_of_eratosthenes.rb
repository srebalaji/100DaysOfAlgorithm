# Sieve Of Eratosthenes

@n = 5

@prime = []

(1..@n+1).each do 
	@prime << true
end

@prime[0] = false
@prime[1] = false

@prime_num = 2

def cross_number(number)
	i = number * number
	loop do
		break if i > @n
		@prime[i] = false
		i += number
	end
end

def get_next_prime
	next_num = @prime_num + 1
	loop do
		break if next_num > @n
		break if @prime[next_num] == true
		next_num += 1
	end
	next_num
end


while(@prime_num <= Math.sqrt(@n))
	cross_number(@prime_num)
	@prime_num = get_next_prime
end

p @prime