#Our CLI Controller
class NameMeaning::CLI

  def call
    puts "Welcome to NameMeaning!"
    search_name
    goodbye
  end

  def search_name

      puts "What name do you want to search:"
    
      user_input = gets.chomp

      result = Scraper.scrape_index_page(user_input)

      if result == "error message"
      puts "#{user_input} - Name not found. Search another name."

      search_name

      else 
      puts "#{user_input} - Name found"

      menu
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Type 1 to see info\n
          Type 2 to see meaning\n
          Type 3 to view in your browser\n
          Type 'exit' to quit"

    input = gets.strip.downcase

    case input
    when "1"
      puts "#{name.info}"
    when "2"
      puts "#{name.meaning}"
    when "3"
      Launchy.open(name.url)
    when "name"
      search_name
    when "exit"
      puts "Thank you for using NameMeaning! Goodbye!"
    else
      puts "I don't understand what you want. Please type name to go back to search or type exit."
    end
  end
  end

  # def goodbye
  #   puts "Thank you for using NameMeaning! Goodbye!"
  # end
end
