def insertion_sort(array)
  (1...array.length).each do |index|
    temp_value = index
    position = index - 1

    while position >= 0
      if array[position] > temp_value
        array[position + 1] = array[position]
        position = position - 1
      else
        break
      end
    end
     array[position + 1] = temp_value
  end
  return array
end

p insertion_sort([1,4,7,8,3,2,4,6])