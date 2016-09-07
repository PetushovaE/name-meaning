require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

	def self.scrape_index_page(user_input)
		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)
		# binding.pry
		name = self.new
		info = doc.css(".nameinfo").text
		meaning = doc.css(".style").text
    end
end

Scraper.scrape_index_page("katerina")