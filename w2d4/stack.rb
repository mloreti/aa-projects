class Stack
  attr_reader :max, :min
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def push(el)
    @max = el if @max.nil? || @max < el
    @min = el if @min.nil? || @min > el
    @store.push(el)
  end

  def pop
    @store.pop
    @max = @store.max
    @min = @store.min
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
