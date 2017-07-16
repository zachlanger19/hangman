#! /usr/bin/env ruby

words = []
File.open('wordsSortedIntuitively.txt').each do |line|
  word = line.chomp.to_s
  words.insert(-1, word)
end

guessed_letters = []
number_of_errors = 0
length_indexes = [0, 26, 445, 2_476, 9_204, 24_051, 52_178, 91_873,
                  140_877, 191_532, 234_952, 270_564, 298_233, 318_204, 331_776,
                  340_300, 345_332, 348_229, 349_674, 350_423, 350_778, 350_945,
                  351_018, 351_048, 351_060, 351_068, 351_071, 351_073, 351_075]

puts 'HANGMAN'
puts 'Think of a word'
puts 'How many letters is it?'
word_length = gets.chomp.to_i

# Get words that match desired length
start_index = length_indexes[word_length - 1]
end_index = length_indexes[word_length] - 1
words = words[start_index..end_index]
puts "There are #{words.length} possibilities"

def pick_letter(words, guessed_letters)
  # Create initial hash of available letters
  letters = {}
  ('a'..'z').each do |letter|
    letters[letter] = 0
  end

  # Count occurrences
  words.each do |word|
    word.split('').each do |occurred_letter|
      letters[occurred_letter] += 1
    end
  end

  # Find best letter
  picked_letter = ''
  picked_number_of_occurrences = 0
  letters.each do |letter, occurrences|
    if !guessed_letters.include?(letter) && occurrences > picked_number_of_occurrences
      picked_letter = letter
      picked_number_of_occurrences = occurrences
    end
  end

  picked_letter
end

# Main
until words.length <= 1 || number_of_errors == 7
  guessed_letter = pick_letter(words, guessed_letters)
  guessed_letters.push(guessed_letter)
  puts "Is there a/an #{guessed_letter}?"
  responce = gets.chomp
  # Keep words that meet specifications
  if responce[0] == 'y'
    puts 'How many times does it occur?'
    number_of_occurrences = gets.chomp.to_i
    number_of_occurrences.times do
      puts 'Which index is it?'
      index = gets.chomp.to_i
      words.select! { |word| word[index] == guessed_letter }
    end
  else
    # Remove words that contain the letter
    words.reject! { |word| word.include?(guessed_letter) }
    number_of_errors += 1
  end

  puts
  puts "Errors: #{number_of_errors}"
  puts "There are #{words.length} possibilities"
end

if number_of_errors == 7
  puts 'You win :('
  puts 'Remaining possibilities:'
  puts words
elsif words.length.zero?
  puts 'There must be some mistake :/'
else
  puts "It's #{words[0]}!!!"
end
