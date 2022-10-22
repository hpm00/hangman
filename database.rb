module Database

    def save_current_game 
        save_game
        name = gets.chomp
        Dir.mkdir 'output' unless Dir.exist? 'output'
        @filename = "#{name}.yaml"
        File.open("output/#{name}", 'w') { |file| file.write save_to_yaml}
    end 

    def save_to_yaml
        YAML.dump(
         'word' => @word,
        'available_letters' => @available_letters,
        'letters_guessed' => @letters_guessed,
        'guesses_remaining' => @guesses_remaining,
        'dashes' => @dashes
        )
    end 

    def file_list
        files = []
        Dir.entries('output').each do |name|
            files.push(name)
        end
        files
    end

    def display_files
        file_list.each do |filename|
            puts filename.to_s
        end
    end 

    def get_file
        display_files
        puts "\nEnter the name of the game you would like to play."
        filename = gets.chomp  
        return filename if file_list.include?(filename)
        puts "\n Invalid input. Please enter a name from the list. "
    end 

    def load_game
        file = YAML.safe_load(File.read("output/#{get_file}"))
        @word = file['word']
        @available_letters = file['available_letters']
        @letters_guessed = file['letters_guessed']
        @guesses_remaining = file['guesses_remaining']
        @dashes = file['dashes']

        puts @dashes 
        puts "Letters guessed: #{@letters_guessed.join(", ")}".magenta
        puts "Incorrect guesses remaining: #{@guesses_remaining}".blue

        display_letter until @guesses_remaining == 0 || @dashes.include?("_") == false || @letter == 'save'
        outro 
    end

end