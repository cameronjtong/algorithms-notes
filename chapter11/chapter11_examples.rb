#countdown

def countdown(number)
  if number < 0
    return
  else
    print number
    countdown(number -1)
  end
end

countdown(10)

#finding directories

def find_directories(directory)
  Dir.foreach(directory) do |filename|
    if File.directory?("#{directory}/#{filename}") &&
      filename != "." && filename != ".."
      puts "#{directory}/#{filename}"

      find_directories("#{directory}/#{filename}")
    end
  end
end

#cdouble each element in array => in-place modification
#use an extra parameter to track index
def double_array(array, index = 0) #provide a default value
  return if index >= array.length # base case
  array[index] *= 2
  double_array(array, index + 1)
  return array
end
SAMPLE_ARRAY = [1,2,3,4]

p double_array(SAMPLE_ARRAY)
#find factorials using loops
def factorial(n)
  product = 1
  (1..n).each do |num|
    product *= num
  end
  return product
  end


  #find factorials using recursion
  #identified the subproblem in the multiplication
  def factorial(n)
    if number == 1
      return 1
    else
    return n * factorial(n -1) #very terse
  end
  end

  #array sum

  def sum(array)
    return array[0] if array.length == 1
    return array[0] + sum(array[1..])
  end

  p sum(SAMPLE_ARRAY)

  def string_reversal(string)
    return string[0] if string.length == 1
    return string_reversal(string[1..]) + string[0]
  end

  p string_reversal('namtab')

  #count number of x's in a string

  def count_x(string)
    if string.length == 1
      if string[0] =='x'
        return 1
      else
        return 0
      end
    end
    if string[0] == 'x'
      return 1 + count_x(string[1..])
    else
      return count_x(string[1..])
    end
  end

  #staircase problem

  def step_routes(number_of_stairs)
    return 0 if number_of_stairs <= 0
    return 1 if number_of_stairs == 1
    return 2 if number_of_stairs == 2
    return 4 if number_of_stairs == 3
    return step_routes(number_of_stairs - 3) + step_routes(number_of_stairs -2) + step_routes(number_of_stairs -1)
  end

  #anagram generation

  def anagrams_for(string)
    return [string[0]] if string.length == 1

    collection = []

    substring_anagrams = anagrams_for(string[1..])
    substring_anagrams.each do |anagram|
      (0..anagram.length).each do |index|

        copy = String.new(anagram)
        collection << copy.insert(index, string[0])
      end
    end
    return collection
  end

  #exercises

  def number_of_characters(array)
    return array[0].length if array.length == 1
    return array[0].length + number_of_characters(array[1..])
  end

  p number_of_characters(%w[hello my name is])

  #function that only returns even numbers

  def even_numbers_only(array, tracked_array = [], index = 0)
    return tracked_array if !array[index]
    tracked_array << array[index] if array[index].even?
    even_numbers_only(array, tracked_array, index + 1)
  end

  #OR...

  def select_even(array)
    return [] if array.empty?
    if array[0].even?
      return [array[0]] + select_even(array[1..])
    else
      select_even(array[1..])
    end
  end

  p even_numbers_only([1,3,4,5,6,7,8])
  p select_even([1,2,3,4,5,6])

# sequence of 'triangular numbers'

  def triangular_sequence(n)
    return 1 if n == 1
    return n + triangular_sequence(n -1)
  end

  def find_x_index(string, index = 0)
    return index if string[index] == 'x'
    return find_x_index(string, index + 1)
  end

  #OR....

  def find_x_index(string)
    return 0 if string[0] == 'x'
    return find_x_index(string[1..]) + 1
  end