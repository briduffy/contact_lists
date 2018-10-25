@contacts = []

def menu
  puts `clear`
  puts "================================"
  puts "Hello! Choose an option below!"1
  puts "1) View All Contacts"
  puts "2) Create Contact"
  puts "3) Exit"
  puts "================================="
  user_input = gets.strip.downcase
  user_input.to_i
end

def contact_input
  puts "What is the contact name?"
  contact_name = gets.strip
  if contact_name.length > 0
    @contacts << contact_name
    puts "#{contact_name} Added."
  else
    puts "Please supply a contact name."
    contact_input
  end
end

while true
  case menu
    when 1
      puts @contacts.join("\n")
    when 2
      contact_input
    when 3
      puts "Goodbye!"
      Exit
    else
      puts "Oops! Try again!"
      menu
    end
end