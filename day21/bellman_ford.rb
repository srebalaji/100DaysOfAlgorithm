# Bellman Ford

class Node
	attr_accessor :data, :nodes, :path

	def initialize(data)
		@data = data
		@nodes = []
		@path
	end
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')

@graph = [a,b,c,d,e]
@queue = {}
@queue_temp = []
@inc = 0

a.nodes << [b, 5]
a.nodes << [c, 2]
b.nodes << [e, 4]
c.nodes << [b, 2]
c.nodes << [d, 4]
d.nodes << [e, 4]
b.nodes << [c, -3]


def traverse_node(node)
	# p @queue.keys.map(&:data)
	# p @queue.values
	# p @queue_temp.map(&:data)
	p @graph.map(&:path)
	p "--------"
	
	if node.nil?
		@inc = 0
		return
	end

	current_node_weight = @queue[node]
	# @queue.delete(node)

	node.nodes.each do |element|
		selected_element = element[0]
		weight = element[1]


		if @queue[selected_element].nil?
			@queue[selected_element] = current_node_weight + weight
			@queue_temp << selected_element
			selected_element.path = current_node_weight + weight
		else
			if @queue[selected_element] > current_node_weight + weight && (current_node_weight + weight) >= 0
				@queue[selected_element] = current_node_weight + weight
				selected_element.path = current_node_weight + weight
			end
		end
	end

	@inc += 1
	traverse_node(@queue_temp[@inc])
end

@queue[a] = 0
@queue_temp << a
a.path = 0
(1..4).each do 
	traverse_node(a)
end

p @graph.map(&:path)