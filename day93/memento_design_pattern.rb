# Memento Design pattern

class FileWrite
	attr_accessor :name, :content, :obj
	def initialize(name)
		@name = name
		@content = ""
		@obj = nil
	end

	def write(con)
		@content = con
	end

	def save
		@obj = CareTaker.new(content)
	end

	def undo
		@content = obj.content
	end

	def display
		@content
	end
end

class CareTaker
	attr_accessor :content
	def initialize(content)
		@content = content
	end
end

file_writer = FileWrite.new("new.txt")
file_writer.write("forief erfner iner")
file_writer.save
p file_writer.display
file_writer.write("from second")
p file_writer.display
file_writer.undo
p file_writer.display