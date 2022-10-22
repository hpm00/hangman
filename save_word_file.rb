require 'open-uri'

File.open('word_list.txt', 'w') do |file|
    URI.open('https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt') do |uri|
        file.write(uri.read)
    end
end

# how to save webpage content to file 