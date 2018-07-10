# Kruskal's Algorithm

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
f = Node.new('f')
g = Node.new('g')

graph = [a,b,c,d,e,f,g]
@queue = []

@vertices = []
@vertices << [a,d,5]
@vertices << [a,c,7]
@vertices << [c,b,8]
@vertices << [d,c,9]
@vertices << [d,e,15]
@vertices << [d,f,6]
@vertices << [f,e,8]
@vertices << [f,g,11]
@vertices << [b,e,5]
@vertices << [e,g,9]
@vertices << [c,e,7]

@set = []
graph.each {|vertice| @set << [vertice.data]}

def find(vertice)
	@set.each_with_index {|value, index| return index if value.include? vertice}
end

def union(a, b)
	@set[a].concat @set[b]
	@set.delete_at(b)
end

def get_min
	edge = @vertices.first
	return edge if edge.nil?
	@vertices.each do |vertice|
		edge = vertice if vertice[2] < edge[2]
	end
	edge
end

def spanning_tree(edge)
	from, to = edge[0].data, edge[1].data

	if find(from) != find(to)
		@queue << [from, to]
		union(find(from), find(to))
	end
	
	@vertices.delete(edge)
	spanning_tree get_min unless get_min.nil?
end

spanning_tree get_min
p @queue
