class Name

	attr_accessor :name, :gender, :pronounced, :meaning
 	
  def initialize(doc, user_input)
    @name = user_input
    @gender = doc.css("div.namesub").first.css("span.info").text
    @pronounced = doc.css("span.info")[3].text
    @meaning = doc.css('div.body-wrapper div.body div div')[21].text
  end
end
	
  	


