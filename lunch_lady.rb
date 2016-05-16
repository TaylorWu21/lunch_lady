require "pry"

@main = [
  {item: 'Burger', cost: 5.00, description: 'Quarterpound beef patty'},
  {item: 'Taco', cost: 4.00, description: 'Stuffed with beef'},
  {item: 'Pizza', cost: 8.00, description: 'Pepperoni'}
]

@side = [
  {item: 'Fries', cost: 2.00, description: 'Hot tasty french fries'},
  {item: 'Rice', cost: 1.00, description: 'White rice'},
  {item: 'Mash potatoes', cost: 1.50, description: 'With gravy'},
  {item: 'Green beans', cost: 1.00, description: 'Beans that are green'}  
]

def main_menu
  puts "Here are our main entrees for today:"
  @main.each_index { |i| puts "#{i + 1} #{@main[i][:item]}: #{@main[i][:cost]}--> #{@main[i][:description]}" }
  puts "Which one would you like?: "
  index = gets.strip.to_i - 1
  @main_entry = @main[index][:item]
  @total_cost = @main[index][:cost]
end

def side_menu
  puts "Which two sides would you like?"
  @side.each_index { |i| puts "#{i + 1} #{@side[i][:item]}: #{@side[i][:cost]}--> #{@side[i][:description]}" }
  puts "Choose first side?:"
  index = gets.strip.to_i - 1
  @first_side = @side[index][:item]
  @total_cost += @side[index][:cost]
  puts "Choose second side?:"
  index = gets.strip.to_i - 1
  @second_side = @side[index][:item]
  @total_cost += @side[index][:cost]
end

def customer_order
  order = []
  order << @main_entry
  order << @first_side
  order << @second_side
  order << @total_cost
  puts "Your main entree is #{order[0]} with a side of #{order[1]} and #{order[2]}"
  puts "The total is #{order[3]}"
end

while true
  puts "Welcome to Taylor's Kitchen!!"
  main_menu 
  side_menu
  customer_order
  puts "To quit press q to make another order press enter"
  if gets.strip == 'q' then exit(0)
  end
end


