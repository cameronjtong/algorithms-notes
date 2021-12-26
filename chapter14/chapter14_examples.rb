#linked list implmentation

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end

end

class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end
#reading takes O(N)
  def read(index)
    current_node = first_node
    current_index = 0
    while current_index < index do
      current_node = current_node.next
      current_index += 1
    end
    return current_node.data
  end

  def index_of(value)
    current_node = first_node
    current_index = 0
    while current_node.data != value do
      current_node = current_node.next
      current_index += 1
    end
    return current_node.data
  end

  def insert_at_index(index, value)
    new_node = Node.new(value)

    if index == 0
      new_node.next = first_node
      self.first_node = new_node
      return
    end

    current_node = first_node
    current_index = 0
    while current_index < (index - 1) do
      current_index += 1
      current_node = current_node.next
    end
    new_node.next = current_node.next
    current_node.next = new_node
  end

  def delete_at(index)
    if index == 0
      self.first_node = first_node.next
      return
    end
    current_node = first_node
    current_index = 0
    until current_index == index -1 do
      current_node = current_node.next
      current_index += 1
    end
    current_node.next = current_node.next.next

  end
end

#doubly linked list

class AnotherNode
  attr_accessor :data, :previous, :next

  def initialize(data)
    @data = data
  end

end

class DoublyLinkedList
  attr_accessor :first, :last

  def initialize(first_node= nil, last_node=nil)
    @first_node = first_node
    @last_node = last_node
  end

  def insert_at_end(value)
    new_node = AnotherNode.new(value)
    if !first
      @first_node = new_node
      @last_node = new_node
    else
      new_node.previous = last_node
      last_node.next = new_node
      @last_node = new_node
    end
  end

  def remove_from_front
    removed_node = first
    first.next.previous = nil
    @first = first.next
    removed_node
  end
end

class Queue
  attr_accessor :queue

  def initialize
    @data = DoublyLinkedList.new
  end

  def enqueue(element)
    @data.insert_at_end(element)
  end

  def dequeue
    removed_node = @data.remove_from_front
    return removed_node
  end

  def read
    return nil unless @data.first_node
    return data.first_node.data
    #data.first_node&.data using the safe operator
  end
end

#exercises

#printing all elements in a linked list

def print_all_elements
  current_node = first
  while current_node do
    puts current_node.data
    current_node = current_node.next
  end
end

def print_in_reverse #in a doubly linked list
  current_node = last
  while current_node do
    puts current_node.data
    current_node = current_node.previous
  end
end

def last_element #regular linked list
  current_node = first
  until !current_node.next do
    current_node = current_node.next
  end
  current_node.data
end

def reverese! #reverse a linked list
  current_node = first
  previous = nil
  while current_node do
    temp = current_node
    current_node.next = previous
    previous = current_node
    current_node = temp.next
  end
end

def delete_from_middle(node)
  node.data = node.next.data
  node.next = node.next.next
end