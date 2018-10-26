class Wallet
  attr_accessor :amount
  def initialize(amount)
    @amount = amount
  end
end

class Buyer
  attr_accessor :dishes, :wallet
  def initialize
    @dishes = []
    @wallet = Wallet.new(20.00)
  end
end

class Dish
  attr_accessor :dish_name, :price
  def initialize(dish_name, price)
    @dish_name = dish_name
    @price = price
  end
end

class LunchLady
  attr_accessor :buyer
  def initialize
    @buyer = Buyer.new
    process_buyer
  end
  
  def menu
    puts "================================"
    puts "Welcome to Lunch Lady! Choose an"
    puts "         option below.          "
    puts "================================"
    puts "1) Order Lunch"
    puts "2) Exit"
    case gets.strip
    when '1'
      pick_main_dish
    when '2'
      exit
    end
  end 

  def pick_main_dish
    puts "=================================="
    puts "  What would you like for lunch?  "
    puts "=================================="
    puts "1) Tacos ($5.00)"
    puts "2) Chicken Burrito ($7.25)"
    puts "3) Enchiladas ($6.00)"
    puts "4) Fajitas ($8.95)"
    case gets.to_i
      when 1
        buyer.dishes << Dish.new("Tacos", 5.00)
      when 2
        buyer.dishes << Dish.new("Chicken Burrito", 7.25)
      when 3
        buyer.dishes << Dish.new("Enchiladas", 6.00)
      when 4
        buyer.dishes << Dish.new("Fajitas", 8.95)
      else
        puts "Oops! Try again!"
        pick_main_dish
    end
  end

  def pick_side_dish
    puts "=================================="
    puts "     What side would you like?    "
    puts "=================================="
    puts "1) Chips and Salsa ($1.00)"
    puts "2) Rice and Beans ($2.25)"
    puts "3) Guacamole ($2.00)"
    puts "4) Mexican Corn ($1.95)"
    case gets.to_i
      when 1
        buyer.dishes << Dish.new("Chips and Salsa", 1.00)
      when 2
        buyer.dishes << Dish.new("Rice and Beans", 2.25)
      when 3
        buyer.dishes << Dish.new("Guacamole", 2.00)
      when 4
        buyer.dishes << Dish.new("Mexican Corn", 1.95)
      else
        puts "Woops, wrong number! Try again."
        pick_side_dish
    end
  end

  def repeat_order
    puts "You've ordered..."
    puts buyer.dishes.map(&:dish_name).join(', ')
  end

  def total_order
    puts "Your order total is: #{buyer.dishes.map(&:price).inject(:+)}"
  end

  def process_buyer
    menu
    2.times {pick_side_dish}
    repeat_order
    total_order
  end
end

LunchLady.new