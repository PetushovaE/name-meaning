require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

	def scrape_index_page(user_input)

		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)

		result = doc.css("div.namemain").first.text
		# binding.pry
		if result == "There was no name definition found for #{user_input.capitalize}."
			return false
		else
			return doc 
		# else result == "Given name #{user_input.capitalize}."
        end
    
  end

 end
