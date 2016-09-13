require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

	def initialize 
	@name_hash = {}
    end

	def scrape_index_page(user_input)

		html = open("http://www.behindthename.com/name/#{user_input}")
		doc = Nokogiri::HTML(html)

		result = doc.css("div.namemain").first.text
		# binding.pry
		if result == "There was no name definition found for #{user_input.capitalize}."
			return false
		else
		# else result == "Given name #{user_input.capitalize}."
		@name_hash[:gender ]= doc.css("div.namesub").first.css("span.info").text
		@name_hash[:script] = doc.css("span.info")[2].text
		@name_hash[:pronounced] = doc.css("span.info")[3].text
        @name_hash[:name] = user_input
		@name_hash[:meaning] = doc.css('div.body-wrapper div.body div div')[21].text
	 	
    end
    @name_hash
  end

  def name_hash
  	@name_hash
  end
 end
