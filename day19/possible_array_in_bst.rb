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
five.left = four
five.right = six

def traverse(node)
	return [root.left, root.right]
end

# Traversing the children of a given node
def print_all_nodes(node)
	left, right = traverse(node)
	traverse(left) unless left.nil?
	traverse(right) unless right.nil?
end

print_all_nodes(eight)

# After getting children of all nodes, weave all the possible ways that the nodes that can be merged.


