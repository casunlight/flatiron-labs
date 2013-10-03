class Array

  def my_each
    if block_given?
      index = 0
      total_items = self.length
      while index < total_items
        yield self[index]
        index += 1
      end
    end
  end

  def my_collect
    collection = []
    if block_given?
      index = 0
      total_items = self.length
      while index < total_items
        collection << (yield(self[index]))
        index += 1
      end
    end
    collection
  end

# Passes each element of the collection to the given block. 
# The method returns true if the block never returns true for 
# all elements. If the block is not given, none? will return 
# true only if none of the collection members is true.


  def my_none?
    if block_given?
      
    end
  end

end

# %w(eins zwei drei vier).my_each do |num|
#   puts num
# end

a = %w(eins zwei drei vier).my_collect do |num|
  "num #{num}"
end

puts a.inspect