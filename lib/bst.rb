class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root
      BinarySearchTree.insert!(@root, value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?
    if node.value >= value
      if node.left
        BinarySearchTree.insert!(node.left, value)
      else
        new_node = BSTNode.new(value)
        node.left = new_node
        node
      end
    else
      if node.right
        BinarySearchTree.insert!(node.right, value)
      else
        new_node = BSTNode.new(value)
        node.right = new_node
        node
      end
    end
  end

  def self.find!(node, value)
    return nil unless node
    if node.value > value
      return nil unless node.left
      BinarySearchTree.find!(node.left, value)
    elsif node.value < value
      return nil unless node.right
      BinarySearchTree.find!(node.right, value)
    else
      node
    end
  end

  # TODO - need to review how this works
  def self.preorder!(node)
    return [] unless node

    arr = [node.value]
    arr += BinarySearchTree.preorder!(node.left) if node.left
    arr += BinarySearchTree.preorder!(node.right) if node.right

    arr
  end

  # TODO - need to review how this works
  def self.inorder!(node)
    return [] unless node

    arr = []
    arr += BinarySearchTree.inorder!(node.left) if node.left
    arr << node.value
    arr += BinarySearchTree.inorder!(node.right) if node.right

    arr
  end

  # TODO - need to review how this works
  def self.postorder!(node)
    return [] unless node

    arr = []
    arr += BinarySearchTree.postorder!(node.left) if node.left
    arr += BinarySearchTree.postorder!(node.right) if node.right
    arr << node.value

    arr
  end

  def self.height!(node)
    return -1 unless node

    1 + [BinarySearchTree.height!(node.left), BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return nil unless node
    if node.right
      BinarySearchTree.max(node.right)
    else
      node
    end
  end

  def self.min(node)
    return nil unless node
    if node.left
      BinarySearchTree.min(node.left)
    else
      node
    end
  end

  def self.delete_min!(node)
    return nil unless node
    if node.left
      node.left = BinarySearchTree.delete_min!(node.left)
      return node
    else
      return node.right
    end
  end

  # TODO - need to review how this works
  def self.delete!(node, value)
    return nil unless node
    if node.value > value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif node.value < value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      t = node
      node = t.right.min
      node.right = BinarySearchTree.delete_min!(t.right)
      node.left = t.left
    end

    node

  end
end
