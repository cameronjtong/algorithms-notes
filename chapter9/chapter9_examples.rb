# Stack implementation
# essentials wraps an array and limits the functionality of the array

class Stack
  def initialize
    @data = []
  end

  def push(element)
    @data << element
  end

  def pop
    @data.pop
  end

  def read
    @data.last
  end
end

# can use a stack to construct a linter
# add opening tags to data
# if we can a closing tag pop from the stack and make sure they match
#this takes advantage of the stack providing the most recent opening tag
class Linter
  def initialize
    @stack = Stack.new
  end

  def lint(text)
    text.each_char do |char|
      if is_opening_brace?(char)
        @stack.push(char)
      elsif is_closing_brace?(char)
        popped_element = @stack.pop

        return "#{char} doesnt have an opening brace" unless popped_element

        return "#{char} has mismatched opening brace" if is_not_a_match?(popped_element, char)
      end
    end
    return "#{@stack.read} doesnt have a closing brace" if @stack.read

    true
  end

  private

  def is_opening_brace?(char)
    ["{", "[", "("].include(char)
  end

  def is_closing_brace?(char)
    ["]", "}", ")"].include?(char)
  end

  def is_not_a_match?(opening_brace, closing_brace)
    closing_brace != { "{" => "}", "[" => "]", "(" => ")" }[opening_brace]
  end
end

#queue implementation

class Queue
  def initialize
    @data = []
  end

  def enqueue(element)
    @data << element
  end

  def dequeue
    @data.shift
  end

  def read
    @data.first
  end
end