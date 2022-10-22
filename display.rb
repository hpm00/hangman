module Display

  def title 
    puts "Welcome to Hangman. Guess the hidden word by entering a letter for each turn."
    puts "After selecting 10 incorrect letters, you will hang (lose)!"
  end
  
  def intro
    puts "Would you like to: \n1) start a new game \n2) load a previous game."
  end

  def user_selection
    answer = gets.chomp
    return answer if answer.match?(/^[1-2]$/)
    intro
  end

  def instruction
    "Enter a letter or Enter 'save' to save your game for next time."
  end

  def saved_message
    "Your game has been saved. Remember what you named your game."
  end 

  def invalid_guess
    "Invalid. Please enter a single, non-selected letter only."
  end 

  def wrong_guess_message
    puts "Better luck next time!"
  end 

  def correct_letter_message
    puts "That's it!"
  end 

end