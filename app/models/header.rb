class Header < ActiveRecord::Base
    def self.header_logo
        puts "                                                      
        ██████╗ ███████╗ ██████╗██╗██████╗ ███████╗███╗   ███╗███████╗
        ██╔══██╗██╔════╝██╔════╝██║██╔══██╗██╔════╝████╗ ████║██╔════╝
        ██████╔╝█████╗  ██║     ██║██████╔╝█████╗  ██╔████╔██║█████╗  
        ██╔══██╗██╔══╝  ██║     ██║██╔═══╝ ██╔══╝  ██║╚██╔╝██║██╔══╝  
        ██║  ██║███████╗╚██████╗██║██║     ███████╗██║ ╚═╝ ██║███████╗
        ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝╚══════╝
                                                                    "                                                                                
        puts "Welcome to RecipeMe!"
        puts "\n"
    end
end