# check for lower values
#makes several comparisons
#only one swap per loop though, better than bubble sort
def selection_sort(array)
  (0...(array.length - 1)).each do |i|
    lowest_number_index = i
    ((i+1)...array.length).each do |j|
      lowest_number_index = j if array[i] > array[j]
    end
    if lowest_number_index != i
      array[i], array[lowest_number_index] = array[lowest_number_index], array[i]
    end
  end
  return array
end

p selection_sort([1,2,6,7,9,2,4,6])

















































