words = %w[apple orange pear banana strawberry plum]
word = words[rand(words.length)]
errors = 0
guessed_letters = []
game_over = false
guess = ''

puts 'Welcome to hang man!'
puts 'Guess a letter to start'

def print_man(errors)
  puts '---'
  case errors
    when 0
      puts '|   '
      puts '|   '
      puts '|   '
      puts '|   '
    when 1
      puts '|  O'
      puts '|   '
      puts '|   '
      puts '|   '
    when 2
      puts '|  O'
      puts '|  |'
      puts '|   '
      puts '|   '
    when 3
      puts '|  O'
      puts '| /|'
      puts '|   '
      puts '|   '
    when 4
      puts '|  O'
      puts '| /|\\'
      puts '|   '
      puts '|   '
    when 5
      puts '|  O'
      puts '| /|\\'
      puts '|  |'
      puts '|   '
    when 6
      puts '|  O'
      puts '| /|\\'
      puts '|  |'
      puts '| /'
    when 7
      puts '|  O'
      puts '| /|\\'
      puts '|  |'
      puts '| / \\'
  end
end

until game_over || errors == 7
  guess = gets.chomp
  while guess.length != 1 || guessed_letters.include?(guess)
    puts 'invalid input'
    guess = gets.chomp
  end
  guessed_letters.push(guess)

  if word.include?(guess)
    puts 'Correct!'
  else
    puts 'Wrong!'
    errors += 1
  end

  game_over = true
  word.split('').each do |c|
    if guessed_letters.include?(c)
      print c
    else
      print '_'
      game_over = false
    end
  end
  puts

  print_man(errors)
end
if errors == 7
  puts 'YOU LOST!'
else
  puts 'YOU WON!'
end
puts word
