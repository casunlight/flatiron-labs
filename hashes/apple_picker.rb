# Author: Manuel Neuhauser
# Date : 9/30/2013
# Email: manuel.neuhauser@flatironschool.com
 
 tree = ["apple", "orange", "apple"]


# def apple_picker(tree)
#   tree.collect do |fruit|
#     fruit if fruit == 'apple'
#   end.compact  
# end

def apple_picker(tree)
  tree.select do |fruit|
    fruit == "apple"
  end
end

basket = apple_picker(tree)

puts basket

# When using collect/map an item is return for every iteration regardless if the element 
# is wanted in the new array or not, while select will conditionally add elements to the new array.