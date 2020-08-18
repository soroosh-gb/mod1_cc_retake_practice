class MenuItem
    # CARYN SAYS: indent attrs and class variables please! 
    # this is all super clean, good job! 
    attr_accessor :price, :restaurant, :recipe
    @@all = []
    def initialize(restaurant, recipe, price)
        @restaurant = restaurant
        @recipe = recipe
        @price = price
        @@all << self
    end

    def self.all
        @@all
    end

    def owner
        self.restaurant.owner
    end

    def self.most_expensive_item
        self.all.max{|a,b| a.price<=>b.price}
    end
    

end
