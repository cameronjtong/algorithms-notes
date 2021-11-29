# all examples translated to ruby
#return index if its present, if we move past it and the array elements are greater than our search, break
def linerar_search(array, search_value)
  array.each_with_index do |element, index|
    if element == search_value
      return index
    elsif element > search_value
      break
    end
  end
end

def binary_search(array, search_value)
  lower_bound = 0
  upper_bound = (array.length - 1)

  while upper_bound >= lower_bound
    mid_point = (upper_bound - lower_bound) / 2

    value_at_midpoint = array[mid_point]

    if value_at_midpoint == search_value
      return mid_point
    elsif value_at_midpoint > search_value
      upper_bound = mid_point -1
    elsif search_value > value_at_midpoint
      lower_bound = mid_point + 1
    end
  end
  return nil
end