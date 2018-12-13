# step through all the lines in the file and see where there are overlapping
# sections of a 2d array

open("input.txt") do file

    #create a 2d array to keep track of where sections are
    fullFabric = zeros(Int, 1000, 1000)

    for line in eachline(file)
        keyVals = collect(eachmatch(r"#(\d+) @ (\d+),(\d+): (\d+)x(\d+)", line))[1]
        index  = parse(Int, keyVals[1])
        startX = parse(Int, keyVals[2]) + 1
        startY = parse(Int, keyVals[3]) + 1
        sizeX  = parse(Int, keyVals[4])
        sizeY  = parse(Int, keyVals[5])

        println("fullFabric[$(startX):$(startX+sizeX), $(startY):$(startY+sizeY)] += ones(Int, $(sizeX), $(sizeY));")
        fullFabric[startX:startX+sizeX, startY:startY+sizeY] += ones(Int, sizeX, sizeY);
    end

    

    println(count(x->(x>1), fullFabric[:,1]))

end