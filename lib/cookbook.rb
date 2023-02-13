require "csv"
require_relative "recipe"

class Cookbook
  attr_accessor :recipes, :csv_file_path, :recipe_index

  def initialize(csv_file_path)
    @recipes = []
    @file_path = csv_file_path

    CSV.foreach(@file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def all
    @recipes
  end

  def save_csv
    CSV.open(@file_path, "wb") do |csv|
      @recipes.each do |item|
        csv << [item.name, item.description]
      end
    end
  end

  def add_recipe(recipe)
    @recipes << recipe

    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end
end
