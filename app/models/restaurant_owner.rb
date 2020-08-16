class RestaurantOwner
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
            restaurant.owner = buyer
        else
            "This restaurant does not belong to #{self.name}!"
        end
    end

end