require "rest-client"

class Bing
	URL = "https://www.bing.com/search?q="

	def self.convert(query)
		query.split(" ").join("+")
	end

	def self.input
		puts "\n Search..."
		response = gets.chomp
	end

	def self.search
		while true
			query = self.input
			break if query == 'q'
			response = RestClient.get(URL + self.convert(query))
			self.print_links(response)
		end
	end
end
