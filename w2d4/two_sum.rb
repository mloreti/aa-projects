def bad_two_sum?(array, target)
  (0...array.length).each do |i|
    (i+1...array.length).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
end

def okay_two_sum?(array, target)
  array.sort!
  array.each_with_index do |el, idx|
    return true if bsearch(array.drop(idx), target - el)
  end

  false
end

def bsearch(array, target)
  array.bsearch{ |x| x == target }
end

def pair_sum?(array, target)
  # require "byebug"
  # debugger
  hash = Hash.new { |k, v| k[v] = [] }
  array.each_with_index do |el, i|
    hash[el] << i
  end
  array.each do |el|
    hash_copy = hash
    hash_copy.delete(el)
    return true unless hash_copy[target - el].empty?
  end
  false
end

# puts "Bad Two Sum"
arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
#
# puts "Okay Two Sum"
# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

puts "Pair Sum"
arr = [0, 1, 5, 7]
p pair_sum?(arr, 6) # => should be true
p pair_sum?(arr, 10) # => should be false
