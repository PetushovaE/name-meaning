#Our CLI Controller

class NameMeaning::CLI

  def call
    puts "*******************************************************************************"
    puts "******* Welcome to NameMeaning CLI Gem Where you can learn about names! *******"
    puts "*******************************************************************************"
    search_name
  end

  def search_name
      puts "What name do you want to search:"
      user_input = gets.strip
      result = Scraper.scrape_index_page(user_input)
      if false
      puts "#{user_input} - Name not found. Search another name."
      search_name
      else 
      puts "#{user_input} - Name found"
       # binding.pry
      menu
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Type 1 to see info\n
          Type 2 to see meaning\n
          Type 3 to view in your browser\n
          Type 'exit' to end the program"

    input = gets.strip.downcase

    case input
    when "1"
      puts "#{info}"
    when "2"
      puts "#{meaning}"
    when "3"
      Launchy.open(name.url)
    when "search"
      search_name
    when "exit"
      puts "Thank you for checking out NameMeaning CLI Gem. Goodbye!"
    else
      puts "Not sure what you want, type search or exit."
    end
  end
  end
end
