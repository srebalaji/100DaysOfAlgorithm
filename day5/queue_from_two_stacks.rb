# Queue by two stacks.

# Implement a queue from two stacks.

stack_one = []
stack_two = []

puts "Enter the queue size:"
n = gets.chomp.to_i

(1..n).each do
	stack_one << gets.chomp.to_i
end

p stack_one
puts "--------------"
puts "1. insert 2. Remove 3. Length 4.exit"
loop do
	input = gets.chomp.to_i
	break if input == 4

	if input == 1
		puts "Enter element:"
		element = gets.chomp.to_i
		stack_one << element
	end

	if input == 2
		if stack_two.length == 0
			until stack_one.length == 0
				popped_element = stack_one.pop
				stack_two << popped_element if stack_one.length != 0
			end
			puts popped_element
		else
			removed_element = stack_two.pop
			puts removed_element
		end
	end

	if input == 3
		puts stack_one.length + stack_two.length
	end

	puts "------ ----------"
	p stack_one
	p stack_two
	stack_two.reverse.each {|a| print "#{a} => "}
	stack_one.each {|a| print "#{a} => "}
end