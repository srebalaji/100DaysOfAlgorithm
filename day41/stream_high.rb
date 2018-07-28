# Given a stream of numbers, find the number of elements that are lesser than the given element from the stream.

class Node
  attr_accessor :data, :left, :right, :count
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @count = 0
  end
end

# arr = [5,1,4,4,5,9,7,13,3]
arr = [5,1,4,9,7,13,3]
find_element = 9
@root = nil

def attach_element(node, root)
  if node.data < root.data
    if root.left.nil?
      root.left = node
      root.count += 1
    else
      attach_element(node, root.left)
    end
  else
    if root.right.nil?
      root.right = node
    else
      attach_element(node, root.right)
    end
  end
end

def create_tree(element)
  node = Node.new(element)
  if @root.nil?
    @root = node
  else
    attach_element(node, @root)
  end
end


arr.each do |element|
  # p element
  create_tree(element)
end
p @root.data
p @root.left.count
p @root.right.count
def traverse(node)
  # p node.left.data unless node.left.nil?
  # p node.right.data unless node.right.nil?
  traverse node.left unless node.left.nil?
  traverse node.right unless node.right.nil?
end

traverse(@root)

def find_elements(f_element, root, total_count)
  if root.data == f_element
    return root.count + total_count
  end

  if root.data > f_element
    find_elements(f_element, root.left, total_count)
  else
    total_count += root.count
    find_elements(f_element, root.right, total_count)
  end
end

p @root
p find_elements(find_element, @root, 0)
