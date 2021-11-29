#this function takes time proportional to the size of the array
def average_of_even_numbers(array)
  sum = 0.0
  count_of_even_numbers = 0

  array.each do |number|
    if number.even?
      sum += number
      count_of_even_numbers += 1
    end
  end
  return sum/count_of_even_numbers
end
#word_builder
# nested loop, has N**2 steps
def word_builder(array)
  collection = []

  array.each_with_index do |element, index|
    array.each_with_index do |other_element, other_index|
      if index != other_index
         collection.push(element + other_element)
       end
     end
   end
   collection
end

p word_builder(%w[a e i o u])

#this is a constant time function
#steps do not rely on input size

def sample(array)
  first = array[0]
  middle =array[array.length/2]
  last = array[-1]
  return [first, middle, last]
end

#average celcius
#O(N) function, just because there are two loops doesn't mean O(N**2)!

def average_celsius(fahrenheit_readings)
  celsius_numbers = []

  fahrenheit_readings.each do |fahrenheit_reading|
    celsius_conversion = (fahrenheit_reading -32) / 1.8
    celsius_numbers.push(celsius_conversion)
  end

  sum = 0.0

  celsius_numbers.each do |celsius_number|
    sum += celsius_number
  end
  return sum/celsius_numbers.length
end

#What about nested loops that run a constant number of times??
#clothing sizes
#the inner loop doesn't grow as the input size increases
#this algo has 5N steps per N element
#O(N)

def mark_inventory(clothing_items)
  clothing_options = []
  clothing_items.each do |item|
    (1...6).each do |size|
      clothing_options.append("#{item} Size: #{size}")
    end
  end
  clothing_options
end

p mark_inventory(%w[batsuit suit tux t-shirt])

#count the ones in a multidimensional array
#they loop over different things
#still O(N)
def count_ones(outer_array)
  count = 0
  outer_array.each do |inner_array|
    inner_array.each do |number|
      count += 1 if number == 1
    end
  end
  count
end

#lets examine more examples

def is_pallindrome?(string)
  left_index = 0
  right_index = string.length - 1
  while left_index < (right_index / 2)
    if string[left_index] != string[right_index]
      return false
    end
    left_index += 1
    right_index -= 1
  end
  return true

#what if we want the product of every two numbers in an array
#dont need the inner loop to run for every element
def two_number_products(array)
  products = []
  (0...(array.length -1)).each do |i|
    ((i+1)...array.length).each do |j|
      products.push(array[i] * array[j])
    end
  end
  products
end

#multiple datasets
#O(N*M) is roughly O(N**2)
def two_number_products(array1, array2)
  products = []
  array1.each do |number|
    array2.each do |other_number|
      products.push(number * other_number)
    end
  end
  products
end
#guess every string of a given length
#exponential => very very slow
def every_password(n)
  (('a' * n))..('z' * n)).each do |str|
  puts str
end
end