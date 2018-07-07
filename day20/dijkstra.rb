# Dijkstra algorithm

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

graph = [a,b,c,d,e]

a.nodes << [b, 4]
a.nodes << [c, 1]
b.nodes << [e, 4]
c.nodes << [b, 2]
c.nodes << [d, 4]
d.nodes << [e, 4]

@queue = {}
@done_queue = []

@queue[a] = 0
@queue[b] = -1
@queue[c] = -1
@queue[d] = -1
@queue[e] = -1
 


def get_min_node
	first = nil
	first_weight = 0
	@queue.select{|k,v| v.positive?}.reject{|k, v| @done_queue.include? k}.each do |key, weight|
		if first.nil? || weight < first_weight
			first = key
			first_weight = weight
		end
	end
	first
end

def traverse_graph(node)
	current_node_weight = @queue[node]
	# @queue.delete(node)
	@done_queue << node

	node.nodes.each do |element|
		selected_element = element[0]
		weight = element[1]

		if @queue[selected_element] == -1
			@queue[selected_element] = weight + current_node_weight
			selected_element.path = weight + current_node_weight
		else
			if @queue[selected_element] > current_node_weight + weight
				@queue[selected_element] = current_node_weight + weight
				selected_element.path = current_node_weight + weight
			end
		end
	end
	traverse_graph(get_min_node) unless get_min_node.nil?
end

a.path = 0
traverse_graph(a)
p graph.map(&:path)
