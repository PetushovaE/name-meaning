class Name

	attr_accessor :name, :gender, :pronounced, :meaning
 	
 	@@all = []

 	
 	def initialize(name_hash)
    	name_hash.each do |attribute, value|
      	self.send("#{attribute}=", value)
    end
    @@all << self
  	end
	
  	def self.all
    	@@all
  	end
end


