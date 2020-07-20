require "rest-client"

class Bing
	URL = "https://www.bing.com/search?q="

	def self.convert(query)
		query.split(" ").join("+")
	end

	def self.print_links(response)
		links = response.body.split('<h2><a href="').drop(1)
		links.map! { |link| link.split('" ')[0] }
		puts links
	end

	def self.user_input
		puts "\nWhat do you want to search for? Enter [q] to quit."
		response = gets.chomp
	end

	def self.search
		while true
			query = self.user_input
			break if query == 'q'
			response = RestClient.get(URL + self.convert(query))
			self.print_links(response)
		end
	end
end
