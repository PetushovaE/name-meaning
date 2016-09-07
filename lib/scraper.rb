require 'open-uri'
require 'nokogiri'
require 'pry'
# require 'colorize' what to use to make print colorful?


class Scraper

	def self.scrape_index_page(user_input)
		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)
		result = doc.search('div.nameinfo').text
		if result == "There was no name definition found for #{user_input.capitalize}."
			return false
		else
			return true
		end	
    end
end

Scraper.scrape_index_page("ruchi")