require_relative "cookbook"
require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display_list(recipes)
  end

  def create
    name = @view.ask_for_name_of_recipe
    description = @view.ask_for_description_of_recipe
    new_recipe = Recipe.new(name, description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    list
    number = @view.ask_user_for_delete
    @cookbook.remove_recipe(number - 1)
  end
end
