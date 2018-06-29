# Generate binary search tree

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

arr = [2,4,6,8,10,12,14,16]

root = (arr.count/2)

@root_node_first = nil 

def nodes(arr, root_node)
	length = arr.count

	if length > 2
		root = (length/2)
		# p arr[root]

		if root_node.nil?
			element = Node.new(arr[root])
			@root_node_first = element
			# p root_node_first
		else
			element = Node.new(arr[root])
			# p element
			if root_node.get_data > arr[root]
				root_node.set_left(element)
			else
				root_node.set_right(element)
			end
		end

		nodes(arr.slice(0, (root)), element)
		nodes(arr.slice(root+1, (length - root)), element)
	else
		root = length/2

		if length == 1
			element = Node.new(arr[root])
			if root_node.get_data > arr[root]
				root_node.set_left(element)
			else
				root_node.set_right(element)
			end
		else
			element = Node.new(arr[1])
			if root_node.get_data > arr[1]
				root_node.set_left(element)
			else
				root_node.set_right(element)
			end
			left_element = Node.new(arr.first)
			element.set_left(left_element)
		end
	end
end

nodes(arr, nil)

p @root_node_first
puts "===================\n"
def print_binary(node)
	unless node.get_left.nil?
		left =  node.get_left.get_data
	end
	unless node.get_right.nil?
		right = node.get_right.get_data
	end
	puts "#{left} #{right}" unless node.get_left.nil? && node.get_right.nil?
	print_binary(node.get_left) unless node.get_left.nil?
	print_binary(node.get_right) unless node.get_right.nil?
end
p @root_node_first.get_data
print_binary(@root_node_first)

