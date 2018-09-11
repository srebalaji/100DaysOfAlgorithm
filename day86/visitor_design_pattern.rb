# Visitor Design pattern


module Visit
	def get_price
		p self.class.name
		send "#{self.class.name}_price"
	end

	def Book_price
		5
	end

	def Song_price
		10
	end
end

class Book
	include Visit
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

class Song
	include Visit
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

book = Book.new("book")
p book.get_price
song = Song.new("song")
p song.get_price