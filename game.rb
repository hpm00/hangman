class Game 
  include Display
  
  def initialize
    @available_letters = ('a'..'z').to_a
    @letters_guessed = []
    @guesses_remaining = 10
    play_game
  end

  def play_game 
    title
    intro
    new_game if user_selection == '1'  
    load_game if user_selection == '2'
  end

end 