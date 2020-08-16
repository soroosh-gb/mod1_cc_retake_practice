class Recipe
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
    end

    def cheapest_restaurant
        cheapest = (menu_items.min{|a,b| a.price <=> b.price}).restaurant
    end

    # is it cheating?
    def self.inactive
        MenuItem.all.select{|recipe| recipe.restaurant == nil}
    end



end
