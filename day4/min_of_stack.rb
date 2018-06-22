# min of stack.

# At any point of time, return the minium element of an array in O(n)

array = []
min = []
puts "Enter stack size"
n = gets.chomp.to_i

(1..n).each do 
	input = gets.chomp.to_i
	array << input
	if min.length == 0
		min << input 
	else
		if input < min.last
			min << input
		end
	end
	p "min is #{min.last}"
end