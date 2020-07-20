require 'rest-client'

class Bing
  def initialize(url, query)
    @link = RestClient.get(url, { params: { q: query } })
  end

  def print_data
    puts "\nHeaders:\n#{@link.headers}"
    puts "\nCookies:\n#{@link.cookies}"
    puts "\nBody:\n#{@link.body}"
  end

  def print_link
    raw = @link.body.split('b_algo"><h2><a href="').drop(1)
    links = []
    raw.each do |e|
      temp = e.split('" ')
      links << temp[0]
    end
    links.each { |l| puts l }
  end
end
