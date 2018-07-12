# Singleton Instance

class Sample
	@instance = Sample.new

	def self.instance
		@instance
	end

	private_class_method :new
end

s = Sample.instance
p s
a = Sample.instance
p a