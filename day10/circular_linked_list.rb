# Circular linked list

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

	def set_next(next_pointer)
		@next = next_pointer
	end
end

class CircularLinkedList

	def initialize
		@head = nil
		@length = 0
	end

	def length
		@length
	end

	def head
		@head
	end

	def explain
		element = @head
		loop do
			p [element.get_value, element.get_next.get_value]
			element = element.get_next
			break if element.nil? || element == @head
		end
	end

	def insert(data)
		@length += 1
		if @head.nil?
			node = Node.new(data)
			@head = node
		else
			element = @head
			
			while(element.get_next != nil && element.get_next != @head)
				element = element.get_next
			end
			node = Node.new(data)
			element.set_next(node)
			node.set_next(@head)
		end
	end

	def insertAt(pos, data)
		return nil if pos > length+1 || pos <= 0

		if pos == 1
			node = Node.new(data)
			temp = @head
			@head = node
			@head.set_next(temp)
			@length += 1

			element = temp
			while(element.get_next != nil && element.get_next != temp)
				element = element.get_next
			end
			element.set_next(@head)
			return
		end
		element = @head
		prev_element = nil
		iterate_pos = 1
		
		while(element.get_next != nil && element.get_next != @head)
			break if iterate_pos == pos
			iterate_pos += 1
			prev_element = element
			element = element.get_next
		end
	
		temp = element
		if pos == length+1
			temp = @head
			prev_element = element
		end

		node = Node.new(data)
		prev_element.set_next(node)
		node.set_next(temp)
		@length += 1
	end

	def remove(pos = nil)
		if pos.nil?
			element = @head
			prev_element = nil
			while(element.get_next != nil && element.get_next != @head)
				prev_element = element
				element = element.get_next
			end
			prev_element.set_next(@head)
			@length -= 1
		else
			return nil if pos > length || pos <= 0

			element = @head

			if pos == 1
				while(element.get_next != nil && element.get_next != @head)
					element = element.get_next
				end
				@head = @head.get_next
				element.set_next(@head)
				@length -= 1
				return
			end

			prev_element = nil
			iterate_pos = 1
			while(element.get_next != nil && element.get_next != @head)
				break if iterate_pos == pos
				iterate_pos += 1
				prev_element = element
				element = element.get_next
			end

			if pos == length
				prev_element.set_next(@head)
			else
				prev_element.set_next(element.get_next)
				element.set_next(nil)
			end
			@length -= 1

		end
	end

end

list = CircularLinkedList.new
list.insert(10)
list.insert(20)
list.insert(30)
list.insertAt(1, 40)
list.insertAt(4, 40)
list.remove(4)

list.explain
p list.length