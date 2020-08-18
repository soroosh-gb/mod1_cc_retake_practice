# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end



peter = RestaurantOwner.new("Peter", 38)
lila = RestaurantOwner.new("Lila", 42)

alondo = Restaurant.new(peter, "Alondo", 4.0)
zilla = Restaurant.new(peter, "Zilla", 4.8)
sunset = Restaurant.new(lila, "Sunset", 4.5)


carbonara = Recipe.new("Carbonnara", "spaghetti, mushroom, bacon, egg and parmesan")
halibut = Recipe.new("Sauteed Halibut", "Halibut fillet, tomato sauce, osyter mushrooms")
tuna_roll = Recipe.new("Tuna roll", "bluefin tuna, sushi rice, nori, scallions")


spaghetti_carbonara = MenuItem.new(alondo, carbonara, 28.50)
spaghetti_carbonara = MenuItem.new(zilla, carbonara, 30)
sauteed_halibut = MenuItem.new(sunset, halibut, 32)
sushi = MenuItem.new(nil, tuna_roll, 18)

# CARYN SAYS: looks like a good number of instances to test with! 

# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
