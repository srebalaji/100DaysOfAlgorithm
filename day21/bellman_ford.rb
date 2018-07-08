# Bellman Ford

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

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

@queue[a] = 0
@queue[b] = Integer::MAX
@queue[c] = Integer::MAX
@queue[d] = Integer::MAX
@queue[e] = Integer::MAX


@queue_temp = [a,b,c,d,e]

def traverse_node(node)
	if node.nil?
		@inc = 0
		return
	end

	current_node_weight = @queue[node]

	node.nodes.each do |element|
		selected_element = element[0]
		weight = element[1]

		if @queue[selected_element] > current_node_weight + weight && (current_node_weight + weight) >= 0
			@queue[selected_element] = current_node_weight + weight
			selected_element.path = current_node_weight + weight
		end
	end

	@inc += 1
	traverse_node(@queue_temp[@inc])
end


a.path = 0
(1..@queue_temp.length-1).each do 
	traverse_node(a)
end

p @graph.map(&:path)