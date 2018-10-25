@contacts = []

def menu
  puts ''
  puts "================================"
  puts "Hello! Choose an option below!"
  puts "1) Create Contact"
  puts "2) View All Contacts"
  puts "3) Exit"
  puts "================================="
  user_input
end

def user_input
  case gets.to_i
  when 1
    contact_input
  when 2
    puts @contacts.join("\n")
    puts ''
    puts ''
    puts "Would you like to return to the menu? Enter yes or no."
    menu_return
  when 3
    puts "Goodbye!"
    exit
  else
    puts "Oops! Try again!"
    menu
  end
end

def contact_input
  puts "What is the contacts first and last name?"
  name = gets.strip
  if name.length > 0
    @contacts << name
    puts "#{name} was added to your contacts."
    puts ''
    puts ''
    puts "Would you like to return to the menu? Enter yes or no."
    menu_return
  else
    contact_input
  end
end

def menu_return
  case gets.strip.downcase
  when 'yes'
    puts menu
  else
    puts 'Goodbye!'
    exit
  end
end

menu
