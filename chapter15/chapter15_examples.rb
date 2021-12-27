#BST implementation
class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value,left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end
#traverses the tree and recurses
def search(search_value, node)
  return node if node.nil? || node.value == search_value
  if node.value < search_value
    return search(search_value,node.left)
  else
    return search(search_value, node.right)
  end
end

def insert(value, node)
  if value < node.value
    node.left = TreeNode.new(value) if node.left.nil?
    insert(value, node.left)
  else
    node.right = TreeNode.new(value) if node.right.nil?
    insert(value, node.right)
  end
end

def delete(value_to_delete, node)
  return nil if node.nil?

  if value_to_delete < node.value
    node.left = delete(value_to_delete, node.left)
    return node
  elsif value_to_delete > node.value
    node.right = delete(value_to_delete, node.right)
    return node
  elsif node.value == value_to_delete
    return node.right if node.left.nil?
    return node.left if node.right.nil?
    node.right = lift(node.right, node)
    return node
  end

end

def lift(node, node_to_delete)
  if node.left
    node.left = lift(node.left, node_to_delete)
    return node
  else
    node_to_delete.value = node.value
    return node.right
  end
end

#exercises

def find_greatest_value(root)
  return node.value if node.right.nil?
  find_greatest_value(root.right)
end