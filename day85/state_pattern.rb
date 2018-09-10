# State Pattern

class State
	attr_accessor :state
	def initialize
		@state = nil
	end

	def get_state(type)
		@state = 
		if type == "admin"
			Admin.new
		elsif type == "member"
			Member.new
		end
	end
end

class Admin
	def show
		"From admin"
	end
end

class Member
	def show
		"From Member"
	end
end


state = State.new
state.get_state("admin")
p state.state.show
state.get_state("member")
p state.state.show
