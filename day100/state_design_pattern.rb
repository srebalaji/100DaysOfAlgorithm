# State Design Pattern

module Action
	def do_action
		"#{name} has called with state"
	end

	def name
		@name
	end
end

class OnState
	include Action
	def initialize
		@name = "On state"
	end
end

class OffState
	include Action
	def initialize
		@name = "Off state"
	end
end

class TvContext
	include Action
	attr_accessor :state
	def initialize
		@state = nil
	end
	
	def action
		state.do_action
	end
end

tv_context = TvContext.new
tv_context.state = OnState.new
p tv_context.action
tv_context.state = OffState.new
p tv_context.action