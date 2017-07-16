words = Array.new
File.open("words.txt").each do |line|
  word = line.chomp.to_s
  words.insert(-1, word)
end

words.sort_by!(&:length)

File.open('wordsSortedIntuitively.txt', "w+") do |f|
  words.each do |word|
    f.puts(word) if word[/[a-zA-Z]+/] == word
  end
end
