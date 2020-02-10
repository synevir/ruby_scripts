##############################################################
#                                                            #
#  `calc_pension.rb` is a Ruby script for calculating the    #
#   worst continuous range of a person work experience       #
#   according by law changes of 2016.                        #
#                                                            #
##############################################################


require "./worst_range.rb"

puts  "****************** Start data ****************************************"
p array = [1, 2, 3, 0, 1, 15, 34, 0, 0, 1, 3, 2]  # insert your experience array here
frame_percent = 10
frame_size_max = 3

array_improved = Hash.new
array_improved = {
#       arr: array,          # if you need to see values in calculated array
      start: 0,              # begin point of frame
        cnt: 0,              # frame size
      ratio: array.mean      # goal ratio, method from `worst_range.rb` file
    }


puts "Ratio before is #{array_improved[:ratio].round(5)}"
puts

(1..frame_size_max).each do |cnt|                  # Each => count of elements in frame
    (0..array.size-cnt).each do |start|            # Each => start position
         mass = array.clone
         mass.slice!(start, cnt)
         new_ratio = mass.mean.round(5)
         if new_ratio > array_improved[:ratio]
             array_improved = {
                 ratio: new_ratio,
                 start: start,
                   cnt: cnt
             }
             puts "We have a new best ratio:   #{array_improved}"
         end
    end
end
puts "=============== Result block =============="
puts array_improved
puts "==================== end =================="
puts


puts "___________________ Wrost_range funtion ______________________________"
puts worst_range(array, frame_percent)
puts