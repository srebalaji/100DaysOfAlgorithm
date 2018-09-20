# Chain of responsibility

class Currency
	attr_accessor :amount
	def initialize(amt)
		@amount = amt
	end
end

class Rupee20
	attr_accessor :pass
	def initialize
	end

	def set_next_pass(pass)
		@pass = pass
	end

	def get_amount(amt)
		if amt >= 20
			new_amt = amt / 20
			remainder = amt % 20
			puts "Dispensing #{amt} in 20"
			if remainder != 0
				pass.get_amount(remainder)
			end
		else
			pass.get_amount(amt)
		end
	end
end

class Rupee10
	attr_accessor :pass
	def initialize
	end

	def set_next_pass(pass)
		@pass = pass
	end

	def get_amount(amt)
		if amt >= 10
			new_amt = amt / 10
			remainder = amt % 10
			puts "Dispensing #{amt} in 10"
			if remainder != 0
				pass.get_amount(remainder)
			end
		else
			pass.get_amount(amt)
		end
	end
end

rupee20 = Rupee20.new
rupee10 = Rupee10.new

rupee20.set_next_pass(rupee10)

amount_to_fetch = 90

rupee20.get_amount(amount_to_fetch)
