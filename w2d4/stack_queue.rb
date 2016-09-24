require_relative "stack"

class StackQueue
  def initialize
    @enqueue_stack = Stack.new
    @dequeue_stack = Stack.new
  end

  def enqueue(el)
    @enqueue_stack.push(el)
  end

  def dequeue
    unless @dequeue.empty?
      @dequeue.pop
    else
      until @enqueue_stack.size == 1
        @dequeue_stack.push(@enqueue_stack.pop)
      end
      @enqueue_stack.pop
    end

  def size
    @enqueue_stack.size + @dequeue_stack.size
  end

  def empty?
    @enqueue_stack.empty?
  end

  def max
    @enqueue_stack.max
  end

  def min
    @enqueue_stack.min
  end
end
