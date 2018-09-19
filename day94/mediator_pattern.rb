# Mediator Pattern

class User
	attr_accessor :name, :mediator_group
	def initialize(name, mediator_group)
		@name = name
		@mediator_group = mediator_group
	end

	def send(msg)
		puts "#{self.name} has sent #{msg}"
		self.mediator_group.send_message(msg, self)
	end

	def recieve(msg)
		puts "#{self.name} has recieved #{msg}"
	end
end

class Mediator
	attr_accessor :lists
	def initialize
		@lists = []
	end

	def add_user(user)
		lists << user
	end

	def send_message(msg, sending_user)
		lists.each do |user|
			user.recieve(msg) unless sending_user == user
		end
	end
end


mediator = Mediator.new

user1 = User.new("user1", mediator)
user2 = User.new("user2", mediator)
user3 = User.new("user3", mediator)

mediator.add_user(user1)
mediator.add_user(user2)
mediator.add_user(user3)

user1.send("hi")
puts "====="
user2.send("Welcome")