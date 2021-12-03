#first example using recursion
#must establish base case
def countdown(number)
  puts number
  return if number == 0
  countdown(number -1)
end

countdown(10)
#think about the return values as they are popped off the call stack
def factorial(number)
  if number == 1
    return 1
  else return number * factorial(number -1)
  end
end

#filesystem traversal
#has multiple layers without prior knowledge
#this solution can only go one layer deep
def find_directories(directory)
  Dir.foreach(directory) do |filename|
    #some of these filenames might be subdirectories
    if File.directory?("#{directory}/#{filename}") &&
      filename != "." && filename != ".."

      puts "#{directory}/#{filename}"
    end
  end
end

#one way forward would be to bring in another loop to iterate over the filenames
#we can use recursion!
#this solution can go arbitrarily deep
def find_directories(directory)
  Dir.foreach(directory) do |filename|
    if File.directory?("#{directory}/#{filename}") &&
      filename != "." && filename != ".."
      puts "#{directory}/#{filename}"

      find_directories("#{directory}/#{filename}")
    end
  end
end

#exercises

def print_every_other(low,high)
  return if low > high #this is the base case
  puts low
  print_every_other(low + 2, high)
end

def factorial(n)
  return 1 if n == 1
  return n * factorial(n - 2)
  end

  # factorial(10) this is uncallable because n== 1 will never occur as written

  def number_printer(array)
    array.each do |value|
      if value.is_a?(Array)
        number_printer(value)
      else
        puts value
      end
    end
  end

number_printer([1,2,3,[4,5],6,7])