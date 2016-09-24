require 'byebug'

def my_min(array)
  array.each do |el|
    return el if array.all? { |el2| el <= el2 }
  end
end


# my_min test case
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5


def my_min2(array)
  return nil if array.empty?
  min = array.first
  array.drop(1).each { |el| min = el if el < min }
  min
end

# my_min2 test case
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min2(list)  # =>  -5

def lcs1(array) #lcs stands for largest_contiguous_subsum
  subarrays = []
  (0...array.length).each do |i|
    (i+1...array.length).each do |j|
      subarrays << array[i..j]
    end
    subarrays << [array[i]]
  end
  subarrays.map { |subarray| subarray.inject(:+) }.max
end

def lcs2(array)
  # debugger
  maximum = array.first
  array.each_with_index do |el, i|
    (1..array.length - i).each do |slice_size|
      sum = array.slice(i, slice_size).inject(:+)
      maximum = sum if sum > maximum
    end
  end
  maximum
end

def lcs3(array)
  max = array.first
  current = array.first
  array.drop(1).each do |el|
    current = 0 if current < 0
    current += el
    max = current if current > max
  end
  max
end

list = [-5, -1, -3]
p lcs3(list) # => 8
