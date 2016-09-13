#Our CLI Controller
require 'launchy'
require 'colorize'

class NameMeaning::CLI

  def call
    puts "*******************************************************************************"
    puts "        Welcome to NameMeaning CLI Gem Where you can learn about names!        ".blue
    puts "*******************************************************************************"
    search_name
    menu
  end

  def search_name
    puts "What name do you want to search:"
    user_input = gets.strip
    result = Scraper.scrape_index_page(user_input)
    if !result 
      puts "#{user_input} - Name not found. Search another name.".red
      search_name
    else 
      puts "#{user_input} - Name found.".blue
      menu
        # binding.pry
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "\n         -----------------------------------------\n         
          Type 1 to see gender\n
          Type 2 to see meaning\n
          Type 3 to view in your browser\n
          Type 'exit' to end the program\n
          --------------------------------"

    input = gets.strip.downcase

    case input
    when "1"
      puts "GENDER:".blue
      puts "#{:gender}"
      # puts "#{:scripts}"
      # puts "#{:pronounced}."
      puts ""
    when "2"
      puts " MEANING:".blue
      puts "#{:meaning}"
      puts ""
    when "3"
      Launchy.open("http://www.behindthename.com/name/#{user_input}")
    when "search"
      search_name
    when "exit"
      puts "                                                        "
      puts "Thank you for checking out NameMeaning CLI Gem. Goodbye!".capitalize.blue
      puts "                                                        "
      exit
    else
      puts "Not sure what you want, type SEARCH or EXIT.".red
    end
   end
  end
end
