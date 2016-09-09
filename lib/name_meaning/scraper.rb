require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

class Scraper

	def self.scrape_index_page(user_input)
		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)
		result = doc.search("div.namemain").text
        # binding.pry
		if result == "There was no name definition found for #{user_input.capitalize}."
			return false
		else result == "Given name #{user_input.capitalize}."
			return true
	    name = self.new
	 	name.info = doc.search('div.nameinfo').text
	 	name.meaning = doc.search('div.padding').text
	 	#inside dev style="padding"
	 	name.url = doc.search("url").text
    end
  end
end

Scraper.scrape_index_page("ruchi")
