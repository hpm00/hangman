require_relative 'display.rb'

class Game
  include Display

  def initialize
    @available_letters = ('a'..'z').to_a
    @letters_guessed = []
    @guesses_remaining = 10
    @mode = nil
    play_game
  end

  def play_game
    title
    intro
    mode = user_selection
    new_game if mode == '1'
    load_game if mode == '2'
  end

  def user_selection
    answer = gets.chomp
    return answer if answer.match?(/^[1-2]$/)
    puts "Invalid Selection. Please enter '1' or '2'."
    user_selection
  end
  
  def new_game
    random_word
    
  end

  def load_game; end

  def random_word
    words = []
    File.open("word_list.txt").readlines.each { |line| words.push(line) if line.length.between?(6, 12) }
    @word = words.sample
    puts @word
    create_blank_spaces(@word)
  end
end