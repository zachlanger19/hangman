# words = Array.new
# File.open('wordsSortedIntuitively.txt').each do |line|
#   word = line.chomp.to_s
#   words.insert(-1, word)
# end
#
# previous_length = 0
# words.each_with_index do |word, index|
#   if word.length > previous_length
#     print index.to_s + ', '
#     previous_length = word.length
#   end
# end

arr = ['hello', 'world']
puts arr.count('hello')
