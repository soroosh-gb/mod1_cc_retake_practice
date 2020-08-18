class Recipe
    # CARYN SAYS: indent attrs and class variables! 
    attr_reader :name
    attr_accessor :description
    @@all = []
    def initialize(name, description)
        @name = name
        @description = description
        @@all << self        
    end

    def self.all
        @@all 
    end

    def menu_items
        MenuItem.all.select{|item| item.recipe == self}
    end

    def restaurants
        menu_items.map{|item| item.restaurant}
    end

    def average_price
        total = (menu_items.reduce(0.0){|sum ,item| sum + item.price}) / menu_items.length
        # total / menu_items.length
    end

    def highest_price
        # highest_price = 0
        #     menu_items.each do |item|
        #     if item.price > highest_price
        #         highest_price = item.price
        #     end
        # end
        # highest_price
        menu_items.max{|a,b| a.price <=> b.price}
        # CARYN SAYS: just make sure what you're returning here is the price (integer)!!!
    end

    def cheapest_restaurant
        cheapest = (menu_items.min{|a,b| a.price <=> b.price}).restaurant
    end

    # is it cheating?
    def self.inactive
        # CARYN SAYS: this isn't cheating but nor is it entirely correct.
        # Your logic is allllllmost there. A recipe is inactive if it doesnt have any MenuItems,
        # or through that, restaurants.
        # so we need to filter over self.all and grab just Recipe instances where the restaurants array is empty 
        # [] and nil are not the same 
        MenuItem.all.select{|recipe| recipe.restaurant == nil}
    end



end
