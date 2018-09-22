# Composite Design Pattern

module Draw
	def draw(color)
		puts "Drawing #{name} in #{color}"
	end
	def name
		@name
	end
end


class Triangle
	include Draw

	def initialize
		@name = "Triangle"
	end
end

class Circle
	include Draw
	def initialize
		@name = "Circle"
	end
end

class Rectangle
	include Draw
	def initialize
		@name = "Rectangle"
	end
end

class Drawing
	attr_accessor :lists, :color
	def initialize(color)
		@color = color
		@lists = []
	end

	def draw
		@lists.each { |list|
			list.draw(color)
		}
	end

	def add(shape)
		lists << shape
	end
end

drawing = Drawing.new("red")
drawing.add(Circle.new)
drawing.add(Rectangle.new)
drawing.draw