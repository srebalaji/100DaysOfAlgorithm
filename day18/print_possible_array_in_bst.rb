# Given a BST, print all the possible ways we can traverse the tree.

class Node
	attr_accessor :data, :left, :right

	def initialize(data)
		@data = data
		@left = nil
		@right = nil
	end
end

eight = Node.new(8)
five = Node.new(5)
fifteen = Node.new(15)
four = Node.new(4)
six = Node.new(6)


eight.left = five
eight.right = fifteen
# five.left = four
# five.right = six


def traverse_v2(root, pos, arrs)
	left, right = [root.left, root.right]
	unless left.nil? && right.nil?
		if pos == "left"
			arrs << left.data
			arrs << right.data
		else
			arrs << right.data
			arrs << left.data
		end
	else
		arrs << left.data unless left.nil?
		arrs << right.data unless right.nil?
	end

	return [left, right, arrs]
end

def print_array(root, pos = "left", arr = [])
	arr << root.data
	arr2 = arr

	left, right, arr_one = traverse_v2(root, pos, arr)

	left_one, right_one, arr_two = traverse_v2(root, "right", arr2)

	# print_array(left, "right", arr) unless left.nil?
	# print_array(right, "right", arr) unless right.nil?

	# left, right = traverse_v2(root, "right", arr)

	
	p arr_one
	p arr_two
end

print_array(eight, "left")