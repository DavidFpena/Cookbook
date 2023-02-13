class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end

  def name_
    @name
  end

  def description_
    @description
  end
end
