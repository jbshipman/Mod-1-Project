class Recipe < ActiveRecord::Base
  belongs_to :vegetable
  belongs_to :protein

  attr_accessor :recipe_choice

  def self.list_all_recipe_names
    Recipe.all.map { |recipe| recipe.name}
  end 
  
  def self.recipe_select
    prompt = TTY::Prompt.new
    @recipe_choice = prompt.select("Please pick your Recipe", list_all_recipe_names)
      until prompt.yes?("You selected #{@recipe_choice}, is this correct?") == true
        @recipe_choice = prompt.select("Pick your protein carefully this time...", list_all_recipe_names)
      end
    return @recipe_choice 
  end

  def self.recipe_choice
    @recipe_choice
  end

  def self.change
    prompt = TTY::Prompt.new
    recipe_selection = prompt.select("Choose the recipe you'd like to change", list_all_recipe_names)
    recipe_instance = self.find_by(name: recipe_selection)
    recipe_instance.name = prompt.ask("What would you like to change '#{recipe_selection}' to?").capitalize
    if prompt.yes?("You want to change '#{recipe_selection}' to '#{recipe_instance.name}'\n Is this correct?") == true
      recipe_instance.save
    end
  end

  def self.delete
    prompt = TTY::Prompt.new
    recipe_selection = prompt.select("Choose the protein you'd like to delete", list_all_recipe_names)
    recipe_instance = self.find_by(name: recipe_selection)
    if prompt.yes?("You want to delete '#{recipe_selection}'\n Is this correct?") == true
      recipe_instance.destroy
    end
  end

  def self.list
    self.all.map {|recipe| p recipe.name}
  end

  def self.find(name)
    self.all.find_by(name: name)
  end

end 