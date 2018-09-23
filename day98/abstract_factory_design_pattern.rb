# Abstract Factory Design Pattern.

class Computer
	def initialize(specs)
		@specs = specs
	end

	def build
		puts "#{self.name} is created with #{self.specs}"
	end
end

class Pc < Computer
	attr_accessor :specs, :name
	def initialize(specs)
		@name = "Pc"
		@specs = specs
	end
end

class Server < Computer
	attr_accessor :specs, :name
	def initialize(specs)
		@name = "Server"
		@specs = specs
	end
end

class ComputerFactory
	def create_computer(computer)
		computer.build
	end
end

factory = ComputerFactory.new
factory.create_computer(Pc.new("ram with 25gb"))
factory.create_computer(Server.new("Disk space with 100gb"))