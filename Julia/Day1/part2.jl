#note this is more or less a modified version of part1
#but adding to a set each step of the way, and checking to make sure if it is there

open("input.txt") do file
    # collect all numbers from file
    allNumbers = []
    for line in eachline(file)
        push!(allNumbers, line)
    end

    # loop through the list until we find the first repeated value
    found = false
    numbers = Set()
    val = 0
    while !found
        for num in allNumbers
            if in(val, numbers)
                found = true
                break
            else
                push!(numbers, val)
            end
            
            if num[1] == '+'
                val += parse(Int, num[2:end])
            else
                val -= parse(Int, num[2:end])
            end
        end
    end

    println("\n\nFirst repeated value: $(val)")
end