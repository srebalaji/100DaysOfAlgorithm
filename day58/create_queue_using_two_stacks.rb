# Create queue using two stacks.

class Stack
	attr_accessor :stack_one, :stack_two
	def initialize
		@stack_one = []
		@stack_two = []
	end

	def enqueue(element)
		stack_one << element
	end

	def dequeue
		dequeue_from_stack
	end

	def print_elements
		p stack_one
		p stack_two
		p "----"
	end

	private

	def dequeue_from_stack
		return stack_two.pop unless stack_two.empty?
		while !stack_one.empty?
			stack_two << stack_one.pop
		end
		stack_two.pop
	end
end

input = [1,2,3,4,5,6,7,8,9]
stack = Stack.new

input.each do |element|
	stack.enqueue(element)
end

stack.print_elements

stack.dequeue
stack.dequeue

stack.print_elements

stack.enqueue(20)
stack.print_elements
stack.dequeue
stack.print_elements

