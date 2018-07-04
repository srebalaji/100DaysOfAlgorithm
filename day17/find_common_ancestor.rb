# Find common ancestor of the given node

class Node
	attr_accessor :data, :left, :right

	def initialize(data)
		@data = data
		@left = nil
		@right = nil
	end
end

one = Node.new(1)
two = Node.new(2)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
three = Node.new(3)
seven = Node.new(7)
eight = Node.new(8)
nine = Node.new(9)
ten = Node.new(10)
eleven = Node.new(11)

one.left = two
one.right = three
two.left = four
two.right = five
five.left = six
three.right = seven
seven.left = eight
seven.right = nine
four.left = ten
four.right = eleven

def find_children(node, node_one, node_two)
	return true if node.data == node_one || node.data == node_two
	unless node.left.nil?
	 c = find_children(node.left, node_one, node_two)
	 return c if c
	end
	unless node.right.nil?
		d = find_children(node.right, node_one, node_two)
		return d if d
	end
end


def find_ancestor(node_one, node_two, root)

	left = find_children(root.left, node_one, node_two)
	right = find_children(root.right, node_one, node_two)
	
	if left && right
		return root
	elsif left
		find_ancestor(node_one, node_two, root.left)
	else
		find_ancestor(node_one, node_two, root.right)
	end
end

p find_ancestor(10, 3, one).data