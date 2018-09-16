# URL Shortener

class UrlShortener
	attr_accessor :ha
	
	def initialize
		@ha = {}
	end

	def short_it(url)
		shortened = rand(36**4).to_s(36)
		shortened = rand(36**4).to_s(36) until !(ha.value? url)
		ha[url] = shortened
		shortened
	end

	def get(url)
		ha[url]
	end
end

url_shortener = UrlShortener.new
p url_shortener.short_it("google.com")
p url_shortener.get("google.com")