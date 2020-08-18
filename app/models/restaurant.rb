class Restaurant
    # CARYN SAYS: please indent!!!! this all looks great though! 
    attr_accessor :name, :star_rating, :owner
    @@all = []

    def initialize(owner, name, star_rating)
        @owner = owner
        @name = name
        @star_rating = star_rating
        @@all << self
    end


    def self.all
        @@all
    end

    def menu_items
        MenuItem.all.select{|item| item.restaurant == self}
    end

    def recipes
        menu_items.map{|item| item.recipe}
    end

    def has_dish?(recipe)
        recipes.include? (recipe)
    end

    def self.highest_rated
        self.all.max{|a,b| a.star_rating <=> b.star_rating}
    end


end