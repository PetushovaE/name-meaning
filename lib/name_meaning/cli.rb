#Our CLI Controller
require 'launchy'
require 'colorize'

class NameMeaning::CLI

  def call
    puts "*******************************************************************************".blue
    puts ""
    puts "****    Welcome to NameMeaning CLI Gem Where you can learn about names!    ****".upcase.blue
    puts ""
    puts "*******************************************************************************".blue
    search_name
    menu
  end

  def search_name
    puts "What name do you want to search:".white
    user_input = gets.strip
    @new_hash = Scraper.new
    result = @new_hash.scrape_index_page(user_input)
        # binding.pry
    if !result 
      puts "Name not found. Search another name.".red
      search_name
    else 
      name = Name.new(result, user_input)
      puts "Name found. What do you want to do next?".white
      menu(name)
    end
  end

  def menu(name)
    input = nil
    while input != "exit"
    puts "\n         These are the available commands:".white
    puts "\n         -----------------------------------------\n         
          Type 1 to see short info\n
          Type 2 to see meaning\n
          Type 3 to view in your browser\n
          Type 'exit' to end the program\n
          --------------------------------"

    input = gets.strip.downcase

    case input
    when "1"
      puts "INFO:".white
      puts "gender: #{name.gender}"
      puts "pronounced: #{name.pronounced}"
    when "2"
      puts " MEANING:".white
      puts "#{name.meaning}"
    when "3"
      Launchy.open("http://www.behindthename.com/name/#{name.name}")
    when "search"
      search_name
    when "exit"
      puts "*******************************************************************************".blue
      puts "           Thank you for checking out NameMeaning CLI Gem. Goodbye!            ".upcase.blue
      puts "*******************************************************************************".blue
      exit
    else
      puts "Not sure what you want, type SEARCH or EXIT".red
    end
   end
  end
end
