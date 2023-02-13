require_relative "controller"
require_relative "cookbook"

class View
  def display_list(recipes)
    recipes.each_with_index do |row, index|
      puts "#{index + 1} - #{row.name}"
    end
  end

  def ask_for_name_of_recipe
    puts "What is the name of your recipe?"
    gets.chomp
  end

  def ask_for_description_of_recipe
    puts "What is the description of your recipe?"
    gets.chomp
  end

  def ask_user_for_delete
    puts "What is the number recipe you want to delete?"
    gets.chomp.to_i
  end
end
