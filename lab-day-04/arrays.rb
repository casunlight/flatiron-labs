#Construct an array with your favorite foods.
# It should have at least 5 elements. 

fav_foods = [ 'Bison Burger Wrap', 
              'Wiener Schnitzel', 
              'Pad Thai', 
              'Sushi & Sashimi',
              'Burrito'
            ]


# Write a puts which returns your most favorite food 
# out of the array.

puts fav_foods[1] #=> Wiener Schnitzel


# Construct an array with the colors of the rainbow (ROYGBIV)

rainbow = %w(red orange yellow green blue indigo violet)

# Slice the colors Red, Orange, and Yellow out of the array.

rainbow_slice = rainbow.slice(0,3)

# Create an empty array. 

empty_array = []

# Assign values to the the second and 6th position.

empty_array[1] = 'second'
empty_array[5] = 'six'
