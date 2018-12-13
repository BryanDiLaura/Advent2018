#similar to part one, but we are trying to find the region 
#that doesn't overlap with anything else

open("input.txt") do file

    #create a 2d array to keep track of where sections are located
    fullFabric = zeros(Int, 1000, 1000)

    #make an array of our keyVals strings
    allKeyVals = []

    for line in eachline(file)
        #use regex to get all the key values out of the string
        keyVals = collect(eachmatch(r"#(\d+) @ (\d+),(\d+): (\d+)x(\d+)", line))[1]
        index  = parse(Int, keyVals[1])
        startX = parse(Int, keyVals[2]) + 1
        startY = parse(Int, keyVals[3]) + 1
        sizeX  = parse(Int, keyVals[4])
        sizeY  = parse(Int, keyVals[5])

        #populate the dictionary (NOTE THE ORDER!)
        push!(allKeyVals, (startX, startY, sizeX, sizeY))

        #add one for the section to the full piece of fabric. Note that arrays in julia are indexed [row(y), col(x)]
        fullFabric[startY:startY+sizeY-1, startX:startX+sizeX-1] += ones(Int, sizeY, sizeX);
    end


    #check each section to see if it is only 1s. Once it is, we've found our answer
    for (i, val) in enumerate(allKeyVals)
        if fullFabric[val[2]:val[2]+val[4]-1, val[1]:val[1]+val[3]-1] == ones(Int, val[4], val[3])
            println(i)
            break
        end
    end
    
end