# Decortor Pattern

module Car
	def assemble
		puts "Car assembled"
	end
end

class BasicCar
	include Car

	def initialize()

	end

	def assemble
		super
		puts "Basic car assembled"
	end
end

class CarDecorator
	include Car
	@car = nil
	def initialize(car)
		@car = car
	end

	def assemble
		@car.assemble
	end

end

class SportsCar < CarDecorator
	include Car

	def initialize(car)
		super(car)
	end

	def assemble
		super
		puts "SportsCar Assembled"
	end
end

class LuxuryCar < CarDecorator
	include Car

	def initialize(car)
		super(car)
	end

	def assemble
		super
		puts "LuxuryCar Assembled"
	end
end

sports_car = SportsCar.new(BasicCar.new)
sports_car.assemble
luxury_car = LuxuryCar.new(BasicCar.new)
luxury_car.assemble