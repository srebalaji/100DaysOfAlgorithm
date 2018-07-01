# Breadth First Search

class Node
	attr_accessor :data, :nodes, :visited
	def initialize(data)
		@data = data
		@nodes = []
		@visited = false
	end
end

node = Node.new(0)
node_one = Node.new(1)
node_two = Node.new(2)
node_three = Node.new(3)
node_four = Node.new(4)
node_five = Node.new(5)

node.nodes << node_one
node.nodes << node_five
node.nodes << node_four

node_one.nodes << node_four
node_one.nodes << node_three

node_two.nodes << node_one

node_three.nodes << node_two
node_three.nodes << node_four

@arr = []

def traverse(node)
	p node.data
	nodes = node.nodes
	nodes.each {|node| 
		unless node.visited
			node.visited = true
			@arr.push(node)
		end
	}
	while(@arr.length > 0)
		traverse(@arr.shift)
	end
	

end

traverse(node)