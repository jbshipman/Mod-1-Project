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

    # def text_format(text)
    #     # puts recipe instructions with basic formatting
    #     puts text.inspect
    #     i = 1
        
    #     # newline used lump return
    #     if text.scan(/$/)
    #         while i < text.scan(/$/).count do
    #             i += 1
    #             return "#{i}. #{text.split(/$/)[i][1..-1]}"
    #         end 
    #     elsif text.scan(/\d\./) # ordered list lump
    #         while i < text.scan(/\d\./).count do
    #             i += 1
    #             return "#{i}. #{text.split(/\d\./)[i]}"
    #         end
    #     elsif text.scan(/<ol>/) # remove html tags
    #         text_array = text.gsub(/<\/li>|<ol>|<\/ol>|<\/html>|<\/body>/,'').split(/<li>/)
    #         while i < text_array.length do
    #             i += 1
    #             return "#{i}. #{text_array[i]}"
    #         end
    #     else
    #         return text 
    #     end
    # end

end
