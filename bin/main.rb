require "../bing.rb"

url = 'https://www.bing.com/search'
query = 'microverse'
search = Bing.new(url, query)

search.print_link
search.print_data
