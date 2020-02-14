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
        self.show_instructions(recipe_choice)
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

  def self.format(text)
    # i = 0
    
    # # newline used lump return
    # if text.scan(/$/)
    #     while i < text.scan(/$/).count do
    #         puts "#{i+1}. #{text.split(/$/)[i][1..-1]}"
    #         puts
    #         i += 1
    #     end 
    # elsif text.scan(/\d\./) # ordered list lump
    #     while i < text.scan(/\d\./).count do
    #         puts "#{i+1}. #{text.split(/\d\./)[i]}"
    #         i += 1
    #     end
    # elsif text.scan(/<ol>/) # remove html tags
    #     text_array = text.gsub(/<\/li>|<ol>|<\/ol>|<\/html>|<\/body>/,'').split(/<li>/)
    #     while i < text_array.length do
    #         puts "#{i+1}. #{text_array[i]}"
    #         i += 1
    #     end
    # else
        puts text 
    # end
  end 

  def self.show_instructions(recipe_choice)
    # puts recipe_choice.inspect
    single_recipe = self.all.select {|recipe| recipe.name == recipe_choice}
    # puts single_recipe.inspect
    format(single_recipe[0][:instructions])
    # format(new).to_s
  end

  def self.find(name)
    self.all.find_by(name: name)
  end

end 