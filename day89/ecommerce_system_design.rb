# Ecommerce system design.

# Create store
# products
# categories for products

module GlobalStore
	def self.set_store(store)
		@store = store
	end

	def self.store
		@store
	end
end

class Store
	attr_accessor :name
	def initialize(name)
		@name = name
		GlobalStore.set_store(self)
	end
end

class Product
	include GlobalStore
	attr_accessor :name, :price, :quantity, :categories
	def initialize(name, price, quantity, categories)
		@name = name
		@price = price
		@quantity = quantity
		@categories = categories
	end

	def display
		"#{GlobalStore.store.name} has #{name}: #{price} has #{quantity} and in #{display_categories}"
	end

	private

	def display_categories
		categories.map(&:name).join(", ")
	end

end

class Category
	include GlobalStore
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

# User related models

class User
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

class Cart
	attr_accessor :products, :user
	def initialize(user)
		@user = user
		@products = []
	end

	def display
		products.map(&:name)
	end
end


store = Store.new("my store")

mobile = Category.new("mobile")
iphone = Product.new("iphone", 250, 2, [mobile])
mac_book = Product.new("Mac Book", 1000, 3, [Category.new("laptop")])
television = Product.new("Sony tv", 500, 10, [Category.new("tv")])
anti_virus = Product.new("Kaspersky", 300, 30, [Category.new("software")])
pixel = Product.new("Pixel", 200, 4, [mobile])
p iphone.display

user = User.new("Srebalaji")
cart = Cart.new(user)
cart.products << iphone
cart.products << mac_book
p cart.display
