# Parking Lot

# parking lot for cars, bikes and other vechicles
# create free lot for vehicle
# remove vehicle
# charge the vehicle

module AllocateSpace
  def add_space(space)
    self.vehicles << space
  end

  def remove_space(space)
    self.vehicles.reject!{|vehicle| vehicle.id == space.id}
  end
end

class ParkingLot
  attr_accessor :car_lot, :bike_lot, :others_lot
  def initialize
    @@car_lot = CarLot.new
    @@bike_lot = BikeLot.new
    @@others_lot = OtherLot.new
  end

  def self.lot(vehicle_type)
    case vehicle_type
    when "Car"
      return @@car_lot
    when "Bike"
      return @@bike_lot
    when "Others"
      return @@others_lot
    end
  end

  def get_spaces(vehicle_type)
    ParkingLot.lot(vehicle_type).vehicles
  end
end

class CarLot
  attr_accessor :vehicles
  include AllocateSpace
  def initialize
    @type = "Car"
    @charge = 5
    @vehicles = []
  end

end

class BikeLot
  attr_accessor :vehicles
  include AllocateSpace
  def initialize
    @type = "Bike"
    @charge = 10
    @vehicles = []
  end

end

class OtherLot
  attr_accessor :vehicles
  include AllocateSpace
  def initialize
    @type = "Others"
    @charge = 15
    @vehicles = []
  end

end

class Space
  attr_accessor :id
  def initialize
    @id = rand(1...100)
  end
end

class Vehicle
  attr_accessor :type, :space, :lot
  def initialize(type)
    @type = type
    @lot = ParkingLot.lot(type)
    @space = Space.new
  end

  def allocate_space
    lot.add_space(space)
  end

  def remove_space
    lot.remove_space(space)
  end

  def charge
  end
end


parking_lot = ParkingLot.new
car1 = Vehicle.new("Car")
bike = Vehicle.new("Bike")
other = Vehicle.new("Others")

car1.allocate_space

p parking_lot.get_spaces("Car")

car1.remove_space
p parking_lot.get_spaces("Car")
