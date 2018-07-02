# Check if the given binary tree is binary search tree.

class Node
	attr_accessor :data, :left, :right

	def initialize(data)
		@data = data
		@left = nil
		@right = nil
	end

	def set_left(node)
		@left = node
	end

	def set_right(node)
		@right = node
	end

	def get_data
		data
	end

	def get_left
		left
	end

	def get_right
		right
	end
end

root_node = Node.new(8)
four = Node.new(4)
ten = Node.new(10)
two = Node.new(2)
six = Node.new(6)
twenty = Node.new(20)

root_node.set_left(four)
root_node.set_right(ten)
four.set_left(two)
four.set_right(six)
ten.set_right(twenty)

min_range = (0..root_node.get_data)
max_range = (root_node.get_data..Float::INFINITY)


def check_for_bst(node, min_range, max_range)
	# p node.get_data
	unless node.get_left.nil?
		data = node.get_left.get_data
		return false unless min_range.include? data

		min_range_one = (min_range.first..data)
		max_range_one = (data..min_range.last)
		check_for_bst(node.get_left, min_range_one, max_range_one)
	end

	unless node.get_right.nil?
		data = node.get_right.get_data
		return false unless max_range.include? data

		min_range_two = (max_range.first..data)
		max_range_two = (data..max_range.last)
		check_for_bst(node.get_right, min_range_two, max_range_two)
	end
	true
end

p check_for_bst(root_node, min_range, max_range)
