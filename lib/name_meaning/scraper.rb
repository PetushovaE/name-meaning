require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

	def self.scrape_index_page(user_input)

		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)

		result = doc.css("div.namemain").first.text
		# binding.pry
		if result == "There was no name definition found for #{user_input.capitalize}."
			return false
		else result == "Given name #{user_input.capitalize}."
			return true

		name_hash = {}
		# doc.css("div").each do |name|
		# name_name = doc.css(".namemain").first.text
		name_gender = doc.css("div.nameinfo").first.css("span.info").text
		name_scripts = doc.css("span.info")[2].text
		name_pronounced = doc.css("span.info")[3].text


	 	name_meaning = doc.css('div.padding').text #inside dev style="padding"
	 	name_hash << {gender: name_gender , meaning: name_meaning}
    end
    name_hash
  end
 end
# end
# end

# Scraper.new.scrape_index_page
# ruchi = Scraper.scrape_index_page("ruchi")
# ruchi = {name:, info:, meaning:, url:}

# Name.new("ruchi")
