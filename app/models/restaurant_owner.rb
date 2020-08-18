class RestaurantOwner
    # CARYN SAYS: good overall! indent your attrs and class variables please! 
    # right now menu_items will return an array of arrays. See if you can find a way to *flatten* that 
    # so that there aren't nested arrays 
    
    attr_accessor :name, :age 
    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def restaurants
        Restaurant.all.select{|restaurant| restaurant.owner == self}
    end

    def menu_items
        restaurants.map{|restaurant| restaurant.menu_items}
    end

    def self.average_age
        (self.all.reduce(0){|sum, owner| sum + owner.age}) / self.all.length
    end

    def sell_restaurant(restaurant, buyer)
        if self.restaurants.select{|rest| rest}.include? (restaurant) 
            # CARYN SAYS: you can use use self.restaurants.include? since self.restaurants is an array of Restaurant instances 
            restaurant.owner = buyer
        else
            "This restaurant does not belong to #{self.name}!"
            # CARYN SAYS: good! 
        end
    end

end