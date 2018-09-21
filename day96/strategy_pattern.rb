# Strategy pattern

class CreditCardSystem
	attr_accessor :no, :cvv
	def initialize(no, cvv)
		@no = no
		@cvv = cvv
	end

	def pay(total)
		"Paid #{total} using Credit card"
	end
end

class PayPalSystem
	def initialize(email, password)
		@email = email
		@password = password
	end

	def pay(total)
		"Paid #{total} using paypal"
	end
end

class Item
	attr_accessor :name, :price
	def initialize(name, price)
		@name = name
		@price = price
	end
end

class Cart
	attr_accessor :lists
	def initialize
		@lists = []
	end

	def add_item(item)
		lists << item
	end

	def total_cost
		lists.map(&:price).inject(&:+)
	end

	def pay(payment_mode)
		payment_mode.pay(total_cost)
	end
end

item1 = Item.new("iphone", 1000)
item2 = Item.new("ipad", 2000)
item3 = Item.new("iwatch", 5000)

cart = Cart.new
cart.add_item(item1)
cart.add_item(item2)
cart.add_item(item3)
p cart.pay(CreditCardSystem.new("43343343934", "343"))