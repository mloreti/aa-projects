class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if @parent.nil?
      @parent = node
      @parent.children << self
    else
      @parent.children.delete(self)
      @parent = node
      @parent.children << self unless @parent.nil?
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    @children.each do |child|
      answer = child.dfs(target)
      return answer if answer
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      suspect = queue.shift
      return suspect if target == suspect.value
      queue += suspect.children
    end
    nil
  end

end
