# Doubly linked list

class Node
	attr_accessor :value, :next, :prev
	def initialize(value)
		@value = value
		@next = nil
		@prev = nil
	end

	def get_value
		value
	end

	def get_next
		@next
	end

	def get_prev
		prev
	end

	def set_value(value)
		@value = value
	end

	def set_next(next_pointer)
		@next = next_pointer
	end

	def set_prev(prev)
		@prev = prev
	end
end

class DoublyLinkedList
	attr_accessor :head
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
			p element.get_value
			element = element.get_next
		end
	end

	def insert(data)
		@length += 1

		if @head.nil?
			node = Node.new(data)
			@head = node
			# node.set_prev(@head)
		else
			element = @head
			while(element.get_next != nil)
				element = element.get_next
			end
			node = Node.new(data)
			element.set_next(node)
			node.set_prev(element)
		end
	end

	def insertAt(pos, data)
		return nil if pos > length+1 || pos <= 0

		if pos == 1
			node = Node.new(data)
			temp = @head
			@head = node
			@head.set_next(temp)
			temp.set_prev(@head)
			@length += 1
			return
		end

		element = @head
		iterate_pos = 1
		
		while(element.get_next != nil)
			break if iterate_pos == pos
			iterate_pos += 1
			element = element.get_next
		end

		temp = element
		node = Node.new(data)

		if pos == length+1
			element.set_next(node)
			node.set_prev(element)
		else
			element.get_prev.set_next(node)
			node.set_prev(element.get_prev)
			node.set_next(temp)
			temp.set_prev(node)
		end
		@length += 1
	end

	def remove(pos = nil)
		if pos.nil?
			element = @head
			while(element.get_next != nil)
				element = element.get_next
			end
			element.get_prev.set_next(nil)
			@length -= 1
		else
			return nil if pos > length || pos <= 0

			element = @head
			
			if pos == 1
				@head = element.get_next
				@head.set_prev(nil)
				@length -= 1
				return
			end

			iterate_pos = 1

			while(element.get_next != nil)
				break if iterate_pos == pos
				iterate_pos += 1
				element = element.get_next
			end

			if pos == length
				element.get_prev.set_next(nil)
			else
				element.get_prev.set_next(element.get_next)
				element.get_next.set_prev(element.get_prev)
			end
			@length -= 1
		end
	end

end

list = DoublyLinkedList.new
list.insert(10)
list.insert(20)
list.insert(30)
list.insertAt(2, 40)
list.remove(1)
list.explain
# p list.length