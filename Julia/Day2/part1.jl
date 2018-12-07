# goes through strings in file, and counts if they contain exactly two or three of any letter
# then multiplies the number in each group to get a 'checksum'


open("testInput.txt") do file
    contain2 = 0
    contain3 = 0

    # go through each string...
    for line in eachline(file)
        println(line)
        if occursin(r"([a-z]).*\1", line)
            contain2 += 1
            println("contains 2!")
        end

        if occursin(r"([a-z]).*\1.*\1", line)
            contain3 += 1
            println("contains 3!")
        end

        println()
    end

    println("\n\n")
    println("contains 2: $(contain2)")
    println("contains 3: $(contain3)")
    println("Final answer: $(contain2 * contain3)")
end