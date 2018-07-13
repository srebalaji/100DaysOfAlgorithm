# Design a call center

class Call
	attr_accessor :name, :status, :duration
	def initialize(name)
		@name = name
		@status = "open"
		@duration = rand(1..9)
		puts "Created call #{name} with #{duration}"
	end
end

class Queue
	@@queue  = []
	def initialize
	end

	def self.dispatch_new_call(name)
		@@queue << Call.new(name)
		Queue.assign_call(@@queue.shift)
	end

	def self.assign_call(call)
		
		employee = Queue.get_free_employee("executives")
		if !!employee
			Queue.set_employee_as_occupied_and_close_call(employee, call)
			return
		end

		employee = Queue.get_free_employee("managers")
		if !!employee
			Queue.set_employee_as_occupied_and_close_call(employee, call)
			return
		end

		employee = Queue.get_free_employee("directors")
		if !!employee
			Queue.set_employee_as_occupied_and_close_call(employee, call)
			return
		end
	end

	def self.get_free_employee(type)
		employees = Employee.lists
		employees.select {|employee| employee.type == type && employee.is_free}.first
	end

	def self.set_employee_as_occupied_and_close_call(employee, call)
		employee.is_free = false
		call.status = "running"
		Thread.new {
			sleep call.duration
			employee.is_free = true
			call.status = "closed"
			puts "Closed call #{call.name}"
		}
	end
end

class Employee
	attr_accessor :name, :type, :is_free
	@@queue = []

	def initialize(name, type)
		@name = name
		@type = type
		@is_free = true

		@@queue << self
	end

	def self.lists
		@@queue
	end
end

class Executive < Employee
	def initialize(name, type)
		super
	end
end

class Manager < Employee
	def initialize(name, type)
		super
	end
end

class Director < Employee
	def initialize(name, type)
		super
	end
end

e1 = Executive.new("e1", "executives")
e2 = Executive.new("e2", "executives")
# e3 = Executive.new("e3", "executives")
# e4 = Executive.new("e4", "executives")
# e5 = Executive.new("e5", "executives")

m1 = Manager.new("m1", "managers")
m2 = Manager.new("m2", "managers")
m3 = Manager.new("m3", "managers")

d1 = Director.new("d1", "directors")
d2 = Director.new("d2", "directors")


p Employee.lists.map(&:name)

Queue.dispatch_new_call("call one")
Queue.dispatch_new_call("call two")
Queue.dispatch_new_call("call three")

p Employee.lists.map{|e| [e.name, e.is_free]}

while
	command = gets.chomp
	abort("Bye..!") if command == "exit"
	p Employee.lists.map{|e| [e.name, e.is_free]}
end

