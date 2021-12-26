#partitioning and sortable arrays

class SortableArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def partition!(left_pointer, right_pointer)
    pivot_index = right_pointer

    pivot = @array[pivot_index]

    right_pointer -= 1

    while true

      while @array[left_pointer] < pivot do
        left_pointer += 1
      end

      while @array[right_pointer] > pivot do
        right_pointer -= 1
      end

      if left_pointer >= right_pointer do
        break
      else
        @array[left_pointer], @array[right_pointer] = @array[right_pointer], @array[left_pointer]
        left_pointer += 1
      end
  end
  @array[left_pointer], @array[pivot_index] = @array[pivot_index], @array[left_pointer]
  return left_pointer #being used by the quicksort algo, will be explained
end
end

#quicksort
#treat left and right of the pivot as subarrays
#add this method to previous clas

def quicksort!(left_index, right_index)
  if right_index - left_index <= 0
    return array[left_index]
  end

  pivot_index = partition(left_index, right_index)

  quicksort!(left_index, pivot_index - 1)
  quicksort!(pivot_index + 1, right_index)
end

def quickselect(nth_lowest_value, left_index, right_index)
  if right_index - left_index <= 0
    return array[left_index]
  end

  pivot_index = partition!(left_index,right_index)

  if nth_lowest_value < pivot_index
    quickselect!(nth_lowest_value, left_index, pivot_index -1)
  elsif nth_lowest_value > pivot_index
    quickselect!(nth_lowest_value, pivot_index + 1, right_index)
  else
    return @array[pivot_index]
  end
end

#exercises

def three_number_product(array)
  array.sort
  array[-3..-1].sum
end

p three_number_product([76,4,2,4,5,6,6,3,2])

def find_missing_number(arr)
  arr.sort
  arr.each {|number| return number if !arr[number] == number}
end

def find_greatest_sqaured(arr)
  arr.each do |n|
    is_greatest = true
    arr.each do |j|
    is_greatest = false if j > n
  end
  return n if is_greatest
end
end

def greatest_number_log(arr)
  arr.sort
  arr.last
end

def greatest_number_linear(arr)
  greatest = arr.first
  arr.each do |n|
    greatest = n if n > greatest
  end
  greatest
end