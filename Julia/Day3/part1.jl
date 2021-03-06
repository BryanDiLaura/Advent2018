# step through all the lines in the file and see where there are overlapping
# sections of a 2d array

open("input.txt") do file

    #create a 2d array to keep track of where sections are located
    fullFabric = zeros(Int, 1000, 1000)

    for line in eachline(file)
        #use regex to get all the key values out of the string
        keyVals = collect(eachmatch(r"#(\d+) @ (\d+),(\d+): (\d+)x(\d+)", line))[1]
        index  = parse(Int, keyVals[1])
        startX = parse(Int, keyVals[2]) + 1
        startY = parse(Int, keyVals[3]) + 1
        sizeX  = parse(Int, keyVals[4])
        sizeY  = parse(Int, keyVals[5])

        #add one for the section to the full piece of fabric. Note that arrays in julia are indexed [row(y), col(x)]
        fullFabric[startY:startY+sizeY-1, startX:startX+sizeX-1] += ones(Int, sizeY, sizeX);
    end

    #use count function with a lambda to count values > 1
    println(count(x->(x>1), fullFabric[:,:]))

end