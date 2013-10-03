# Author: Manuel Neuhauser
# Date : 10/1/2013
# Email: manuel.neuhauser@flatironschool.com

number_of_disks = 4

a = (1..number_of_disks).to_a
b = []
c = []

# Move the disks from one peg to another following the rules of Hanoi.
#
# number_of_disks - the total number of disks
# from - the starting peg
# to - the ending (goal) peg
# via - the remaining peg (b in this case)
#

def move_disk(number_of_disks,from,to,via)
  if number_of_disks == 0
    to.unshift(from.shift)
  else
    move_disk(number_of_disks-1,from,via,to)  
    to.unshift(from.shift) unless from.empty?
    move_disk(number_of_disks-1,via,to,from)  
  end
  to
end

def print_pegs(number_of_disks,a,b,c)
  all_pegs = [a,b,c]

  (0...number_of_disks).each do |position|
    all_pegs.each do |peg|
      disc_size = peg[position-number_of_disks]
      if disc_size
        print "|" + ("#{'-'*disc_size} #{disc_size} #{'-'*disc_size}".center(number_of_disks * 3, " "))
      else
        print "|" + "I".center(number_of_disks * 3, " ")
      end
    end
    puts "|"
  end
end

# here we go!
puts "\nBefore:"
print_pegs(number_of_disks, a, b, c)

move_disk(number_of_disks, a, c, b)
#move_disk(number_of_disks, a, b, c)

puts "\nAfter:"
print_pegs(number_of_disks, a, b, c)





