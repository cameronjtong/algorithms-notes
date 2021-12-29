# the node points to several other nodes in the children hash
class TrieNode
  attr_reader :children
  def initialize
    @children = {}
  end
end
# trie takes a root element
class Trie
  attr_reader :root
  def initialize
    @root = TrieNode.new
  end

  def autocomplete(prefix)
    current_node = search(prefix)
    if !current_node
      return nil
    else
      return collect_all_words(current_node)
    end
  end

  def autocomplete(word)
    current_node = root
    word_so_far = ""
    word.each do |char|
      if current_node.children.get(char)
        word_so_far += char
        current_node = current_node.children[char]
      else
        return word_so_far + collect_all_words(current_node)
      end
    end
  end

  def search(word)
    current_node = root
    word.each do |char|
      if current_node.children.get(char)
      current_node = current_node.children[char]
    else
      return nil
    end
    end
    return current_node
  end

  def insert(word)
    current_node = root

    word.each do |char|
      if current_node.children.get(char)
        current_node = current_node.children[char]
      else
        new_node = TrieNode.new
        current_node.children[char] = new_node
        current_node = new_node
      end
    end
    current_node.children["*"] = nil
  end

  def collect_all_words(node=nil, word='', words=[])
    current_node = node || root
    current_node.children.each do |key, child_node|
      if key == '*'
        words << word
      else
        collect_all_words(child_node, word + key, words)
      end
    end
    return words
  end
end