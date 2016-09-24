def first_anagram?(string1, string2)
  anagrams = string1.chars.permutation.to_a.map(&:join)
  anagrams.include?(string2)
end

def second_anagram?(string1, string2)
  string1.chars.each_with_index do |letter1, idx1|
    string2.chars.each_with_index do |letter2, idx2|
      if letter1 == letter2
        string1[idx1] = "*"
        string2[idx2] = "*"
      end
    end
  end
  string1.gsub!("*", "")
  string2.gsub!("*", "")
  string1 == "" && string2 == ""
end

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

def fourth_anagram?(string1, string2)
  string1_hash = Hash.new(0)
  string2_hash = Hash.new(0)

  string1.chars.each do |letter|
    string1_hash[letter] += 1
  end

  string2.chars.each do |letter|
    string2_hash[letter] += 1
  end

  string1_hash == string2_hash

end

puts "First Anagram Test"
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

puts "Second Anagram Test"
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

puts "Third Anagram Test"
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true


puts "Fourth Anagram Test"
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
