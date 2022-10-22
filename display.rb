module Display

    def title 
      puts "Welcome to Hangman. Guess the hidden word by entering a letter for each turn."
      puts "After selecting 10 incorrect letters, you will hang (lose)!"
    end
    
    def intro
      puts "\nWould you like to: \n1) start a new game \n2) load a previous game."
    end
  
    def instruction
      "\nEnter a letter or Enter 'save' to save your game for next time."
    end
  
    def saved_message
      "Your game has been saved. Remember what you named your game."
    end 
  
    def invalid_guess
      "Invalid. Please enter a single letter that has not been guessed."
    end 
  
    def wrong_guess_message
      puts "\nUnlucky! The word does not have that letter."
    end 
  
    def correct_letter_message
      puts "\nNice guess."
    end 
  
    def winner
      puts "\nYou guessed the word! You've been spared!"
    end 
  
    def loser
      puts "\nYou didn't guess the word. Better luck next time."
    end
    
end