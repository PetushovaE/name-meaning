class Name
    attr_accessor :name, :info, :meaning, :url

	def initialize(user_input)
		user_input.each {|attr, value| self.send("#{attr}=", value)}
		# @name = name
		# @info = info
		# @meaning = meaning
		# @url = url
    end
end

# hash = {name:, info:, meaning:, url:}
           # added hash and self.send
# hash.send("#{keys}=","value")

