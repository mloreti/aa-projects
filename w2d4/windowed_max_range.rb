require_relative 'stack_queue'

def windowed_max_range_naive(array, window_size)
  current_max_range = nil
  array.each_with_index do |el, idx|
    unless array.length - idx < window_size
      current = array[idx, window_size]
      current_range = current.max - current.min
      if current_max_range.nil?
        current_max_range = current_range
      elsif current_range > current_max_range
        current_max_range = current_range
      end
    end
  end
  current_max_range
end



p windowed_max_range_naive([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_naive([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_naive([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_naive([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


def windowed_max_range()
