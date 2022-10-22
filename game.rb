class Game
  include Display
  include Database

  def initialize
    @available_letters = ('a'..'z').to_a
    @letters_guessed = []
    @guesses_remaining = 10
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
    display_letter until @guesses_remaining == 0 || @dashes.include?("_") == false || @letter == 'save'
    outro 
  end 

  def random_word
    words = []
    File.open("word_list.txt").readlines.each { |line| words.push(line) if line.length.between?(6, 12) }
    @word = words.sample
    puts @word
    create_blank_spaces(@word)
  end

  def create_blank_spaces(word)
    @dashes = ''
    @dashes << '_' until @dashes.length == word.length - 1
    puts @dashes.yellow
    puts "Incorrect guesses remaining: #{@guesses_remaining}".blue
  end

  def get_letter
    instruction 
    loop do
      @letter = gets.chomp.downcase
      break if @letter == 'save' || @letter.match?(/^[\D]$/) && @available_letters.include?(@letter)
      invalid_guess 
    end
    @available_letters.delete(@letter) unless @letter == 'save'
    @letters_guessed.push(@letter) unless @letter == 'save'
  end

  def display_letter
    get_letter 
    return save_current_game if @letter == 'save'
    characters = @word.split("")
    characters.each_with_index do |item, index|
      @dashes[index] = @letter if characters[index] == @letter
    end
    if characters.include?(@letter) == false
      @guesses_remaining -= 1 
      puts wrong_guess_message
    else
      puts correct_letter_message
    end
    puts @dashes.yellow
    puts "Letters guessed: #{@letters_guessed.join(", ")}".magenta
    puts "Incorrect guesses remaining: #{@guesses_remaining}".blue
  end

  def outro
    puts winner if @dashes.include?("_") == false && @guesses_remaining != 0
    puts loser if @guesses_remaining == 0
    puts saved_message if @letter == 'save'
    intro
  end
end