# Sort the given stack.

puts "Enter the stack size"
n = gets.chomp.to_i

stack_one = []
stack_two = []

(1..n).each do 
	stack_one << gets.chomp.to_i
end

puts "Given stack => #{stack_one}"

loop do
	break if stack_one.empty?

	element = stack_one.pop
	if stack_two.empty?
		stack_two << element
	else
		until stack_two.empty? || stack_two.last > element
			stack_one << stack_two.pop
		end
		stack_two << element
	end
end

puts "Sorted stack => #{stack_two}"