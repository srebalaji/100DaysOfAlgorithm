# Linked List Implementation
class Node
	attr_accessor :value, :next
	def initialize(value)
		@value = value
		@next = nil
	end

	def get_value
		@value
	end

	def get_next
		@next
	end

	def set_value(value)
		@value = value
	end

	def set_next(nextp)
		@next = nextp
	end
end

class LinkedList

	def initialize
		@head = nil
		@length = 0
	end

	def length
		@length
	end

	def explain
		element = @head
		loop do
			break if element.nil?
			p [element.get_value, element.get_next]
			element = element.get_next
		end
	end

	def insert(data)
		@length += 1
		if @head.nil?
			node = Node.new(data)
			@head = node
		else
			element = @head
			while(element.get_next != nil)
				element = element.get_next
			end
			node = Node.new(data)
			element.set_next(node)
		end
	end

	# insert into first pos
	# insert into last pos
	# insert into middle - x
	def insertAt(pos, data)
		return nil if pos > length+1
		element = @head
		prev_element = nil
		iterate_pos = 1
		while(element.get_next != nil)
			break if iterate_pos == pos
			iterate_pos += 1
			prev_element = element
			element = element.get_next
		end
		# p element.get_value
		# p prev_element.get_value rescue nil

		temp = element

		node = Node.new(data)
		prev_element.set_next(node)
		node.set_next(temp)
		@length += 1
	end
end


list = LinkedList.new
list.insert(10)
list.insert(20)
list.insert(30)
list.insertAt(4, 40)

list.explain
p list.length