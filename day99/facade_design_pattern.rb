# Facade Design Pattern

class Mysql
	def initialize
	end

	def generate_pdf
		puts "generate pdf report in mysql"
	end

	def generate_html
		puts "generate HTML report in mysql"
	end
end

class Psql
	def initialize
	end

	def generate_pdf
		puts "generate pdf in psql"
	end

	def generate_html
		puts "generate HTML in psql"
	end
end

class Helper
	def initialize
	end

	def generate_report(type, db_type)
		conn = 
		case db_type
		when "mysql"
			Mysql.new
		when "psql"
			Psql.new
		end
		conn.send("generate_#{type}")
	end
end

helper = Helper.new
helper.generate_report("pdf", "mysql")