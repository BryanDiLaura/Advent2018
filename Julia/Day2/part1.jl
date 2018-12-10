# goes through strings in file, and counts if they contain exactly two or three of any letter
# then multiplies the number in each group to get a 'checksum'


open("input.txt") do file
    contain2 = 0
    contain3 = 0

    # go through each string...
    for line in eachline(file)

        #create a dictionary counting character occurances
        charDict = Dict{Char, Integer}()
        println(line)
        for c in line
            charDict[c] = get(charDict, c, 0) + 1
        end

        #add to the counts, and don't repeat
        counted2 = false
        counted3 = false
        for (c, num) in charDict
            if num == 2 && !counted2
                contain2 += 1
                counted2 = true
                println("contains 2!")
            end
            if num == 3 && !counted3
                contain3 += 1
                counted3 = true
                println("contains 3!")
            end
        end

        println()
    end

    println("\n\n")
    println("contains 2: $(contain2)")
    println("contains 3: $(contain3)")
    println("Final answer: $(contain2 * contain3)")
end