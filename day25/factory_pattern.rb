# Factory pattern

class Languages
	def explain
		puts "Programming languages help you build softwares."
	end
end

class Compiler < Languages
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def show
		puts "#{name} is a compiler language."
	end

end

class Interpeter < Languages
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def show
		puts "#{name} is a interpeter language."
	end
end

class FactoryClass
	def self.get_language(type, name)
		if type == "compiler"
			return Compiler.new(name)
		elsif type == "interpeter"
			return Interpeter.new(name)
		else
			return nil
		end
	end
end

factory = FactoryClass.get_language("compiler", "Java")
factory.show
factory.explain
factory = FactoryClass.get_language("interpeter", "Ruby")
factory.show