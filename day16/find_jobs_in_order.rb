# Given jobs with their dependencies, order job without affecting their dependencies.

class Node
	attr_accessor :data, :nodes, :visited
	def initialize(data)
		@data = data
		@visited = false
		@nodes = []
	end
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')

@nodes = [a,b,c,d,e,f]

def add_dependencies(dependent, depender)
	depender.nodes << dependent
end

add_dependencies(a, d)
add_dependencies(f, b)
add_dependencies(b, d)
add_dependencies(f, a)
add_dependencies(d, c)
add_dependencies(b, a)

def get_root
	@nodes.each do |node|
		if node.nodes.empty?
			return node 
		end
	end
	nil
end

def remove_dependencies(root_node)
	@nodes.delete(root_node)
	@nodes.each do |node|
		node.nodes.reject!{|element| element == root_node}
	end
end


while(get_root != nil)
	root = get_root
	p root.data
	remove_dependencies(root)
end

