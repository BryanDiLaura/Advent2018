# goes through the list of words, and finds the two words that are only different by one letter.
# once found, it prints the word (without the difference)


function compare(word1, word2)
    # find the first difference
    for i = 1:length(word1)
        if (word1[i] != word2[i])

            #does the rest of the word match? if so, it is what we're looking for
            if (word1[i+1:end] == word2[i+1:end])
                println("Answer = $(word1[1:i-1] * word1[i+1:end])")
                return true
            else
                return false
            end
        end
    end
    return false
end


open("input.txt") do file
    contain2 = 0
    contain3 = 0
    wordList = []

    # go through each string...
    for line in eachline(file)
        #create a list of all the words
        push!(wordList, line)
    end

    # for each word
    found = false
    for word in wordList
        #compare it against each other word
        for comparedWord in wordList
            if compare(word, comparedWord)
                found = true
                break
            end
        end
        if found
            break
        end
    end

end