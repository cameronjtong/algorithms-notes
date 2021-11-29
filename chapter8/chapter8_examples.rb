#this is a very complex function to search a larger array for a value in the smaller array
def is_subset(array1, array2)
  if array1.length > array2.length
    larger_array = array1
    smaller_array = array2
  else
    smaller_array = array1
    larger_array = array2
  end

  smaller_array.each do |element|
    found_match = false
    larger_array.each do |other_element|
      if element == other_element
        found_match = true
        break
      end
    end
    return false if found_match == false
  end
  return true
end

#fix with hash lookup

def is_subset(array1, array2)
  hash_table = {}
if array1.length > array2.length
    larger_array = array1
    smaller_array = array2
  else
    smaller_array = array1
    larger_array = array2
  end
  larger_array.each do |element|
    hash_table[element] = true
  end
  smaller_array.each do |element|
    return false if !hash_table[element]
  end
end

#exercises

#find the intersection of two arrays

def intersection(array1, array2)
  hash_table = {}
  intersection = []
  array1.each do |element|
    hash_table[element] = true
  end

  array2.each do |element|
    intersection << element if hash_table[element]
  end
  intersection
end

p intersection([1,2,0], [3,4,1,2])

#return first duplicate value in an array of strings

def duplicate_finder(array)
  hash_table = {}
  array.each do |element|
    if hash_table[element]
      return element
    else
      hash_table[element] = true
    end
  end
end

p duplicate_finder(%w[a e i o u a])

#find which letter of the alpabet is missing

def which_letter_is_missing?(string)
  hash_table = {}
  string.each_char do |char|
    hash_table[char] = true
  end
  ("a".."z").each do |char|
    if hash_table[char]
      next
    else
      return char
    end
  end
end

p which_letter_is_missing?("the quick brown box jumps over a lazy dog")

def which_is_non_duplicated?(string)
  hash_table = {}
  string.each_char do |char|
    if hash_table[char]
      hash_table[char] += 1
    else
      hash_table[char] = 1
    end
  end
  string.each_char do |char|
    if hash_table[char] > 1
      return char
    end
  end
end