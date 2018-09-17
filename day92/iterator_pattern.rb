# Iterator Design Pattern

class Channel
	attr_accessor :name
	def initialize(name, type)
		@name = name
		@type = type
	end
end

class Iterator
	attr_accessor :channels, :pos
	def initialize(list_channels)
		@channels = list_channels
		@pos = -1
	end

	def has_next
		if @pos < channels.count-1
			@pos += 1
			true
		else
			false
		end
	end

	def next
		channels[pos]
	end
end

ch1 = Channel.new("ch1", "tamil")
ch2 = Channel.new("ch2", "tamil")
ch3 = Channel.new("ch3", "english")
ch4 = Channel.new("ch4", "english")

iterator = Iterator.new([ch1, ch2, ch3, ch4])

while(iterator.has_next)
	p iterator.next.name
end