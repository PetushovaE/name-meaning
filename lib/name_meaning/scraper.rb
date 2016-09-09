require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

class Scraper

	def self.scrape_index_page(user_input)
		scraped_name = {}

		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)

		scraped_name = doc.search("div.namemain").text
        # binding.pry
		if scraped_name == "There was no name definition found for #{user_input.capitalize}."
			return false
		else scraped_name == "Given name #{user_input.capitalize}."
			return true
	    
	 	scraped_name[:info] = doc.search('div.nameinfo').text
	 	scraped_name[:meaning] = doc.search('div.padding').text #inside dev style="padding"
	 	# scraped_name{:url] = doc.search("di").text
    end
    scraped_name
    # {name:, info:, meaning:, url:}
  end
end

ruchi = Scraper.scrape_index_page("ruchi")
# ruchi = {name:, info:, meaning:, url:}

# Name.new("ruchi")
