#bubble sort
#does comparisions and swaps O(N**2)
def bubble_sort(list)
  #tracks the rightmost unsorted element
  unsorted_until_index = list.length - 1
  sorted = false
# track the right sorted end of the array
  while !sorted
    sorted = true
    (0...unsorted_until_index).each do |i|
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i]
        sorted = false
      end
    end
    unsorted_until_index -= 1
  end
  return list
end

p bubble_sort([2,4,7,4,7,8])

#---this is a O(N**2) algo--

# def has_duplicate_value(array)
#   array.each_with_index do |value, index|
#     array.each_with_index do |other_value, other_index|
#       return true if (value == other_value && index != other_index)
#     end
#   end
#   false
# end

# p has_duplicate_value([2,5,4])

# this can be made linear

def has_duplicate_value(array)
  existing_numbers = []
  array.each do |value|
    if existing_numbers[value] == 1
      return true
    else
      existing_numbers[value] = 1
    end
  end
  false
end

p has_duplicate_value([2,3,4,5,2])

#this is a slow algo O(N**2)
#compare value to all others, if my temp is still true we return it
def greatest_number(array)
  array.each do |value|
    is_i_the_greatest_value = true
    array.each do |other_value|
      if other_value > value
        is_i_the_greatest_value = false
      end
    end
    if is_i_the_greatest_value
      return value
    end
  end
end

p greatest_number([2,2,2,5,6,])

#we can make it faster!

def greatest_number(array)
  current_value = array[0]
  array.each do |value|
    if value > current_value
      current_value = value
    end
  end
  current_value
end