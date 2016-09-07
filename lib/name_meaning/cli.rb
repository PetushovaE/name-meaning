#Our CLI Controller
class NameMeaning::CLI

  def call
    puts "Welcome to NameMeaning!"
    search_name
    goodbye
  end

  def search_name

    puts "What name do you want to search:"
    
     


    # if name found

    #   puts "Name found"

    # menu

    # else
    #   puts "Name not found. Search another name"

    # search_name
    # end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Type 1 to see meaning and origin of the name\n
          Type 2 to see variations\n
          Type 3 to view in your browser\n
          Type 'exit' to quit"

    input = gets.strip.downcase

    case input
    when "1"
      puts "#{name.meaning}"
    when "2"
      puts "#{name.variation}"
    when "3"
      Launchy.open( name.url )
    when "name"
      search_name
    else
      puts "Sorry but I don't understand what you want. Type another name or type exit."
    end
  end
  end

  # def menu
  #   input = nil
  #   while input != "exit"
      
  #     puts "Enter the name you'd like more info on, or type 1 to see meaning and origin of the name, type 2 to see pronunciation or type exit: "
  #     input = gets.strip.downcase

  #   
  #     case input
  #     when "1"
  #     puts "#{name.meaning}"
  #     when "2"
  #     puts "#{name.pronunciation}"
  #     when "name"
  #     search_name
  #     else
  #     puts "Sorry but this name is not available. Type another name or type exit."
  #     end
  #   end
  #   end
  # end

  def goodbye
    puts "Thank you for using NameMeaning! Goodbye!"
  end
end
