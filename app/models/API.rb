class Api < ActiveRecord::Base
    
    def self.search_recipes(protein, veggie)
        prot = protein
        veg = veggie
        #url = "https://api.spoonacular.com/recipes/random?number=1&tags=#{prot},#{veg}&apiKey=5f37997387b14e7d89c66a547ddcce3a"
        url = "https://api.spoonacular.com/recipes/random?number=1&tags=#{prot},#{veg}&apiKey=bb5ee8739db147798c44dc3dfb2a9968"

        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        recipe = response.body
        recipe_hash = JSON.parse(recipe)

        recipe_title = recipe_hash["recipes"][0]["title"]
        
        puts recipe_title
        puts recipe_hash["recipes"][0]["instructions"]
        
        Recipe.create(name: recipe_hash["recipes"][0]["title"], instructions: recipe_hash["recipes"][0]["instructions"])
    end

end
