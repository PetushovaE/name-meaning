require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

	def self.scrape_index_page(user_input)
		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)
		# binding.pry
		name = doc.css("div.nameinfo").text
		meaning = doc.css("div.style").text
		variation = doc.css("span.info").text
    end
end

Scraper.scrape_index_page("katerina")