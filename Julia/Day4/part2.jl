import Dates

open("input.txt") do file

    #make a list to be populated
    allEvents = []

    for line in eachline(file)
        #regex to extract the time and convert to a DateTime
        m = match(r"\[(.*)\] (.*)", line)
        time = Dates.DateTime(m[1], "yyyy-mm-dd HH:MM")
        push!(allEvents, [time, m[2]])
    end

    #sort based on timestamps
    sort!(allEvents)

    #separate by guard num populating an array based on when the guards are asleep
    guardMap = Dict{String, Any}()
    currentGuard = -1
    inShift = false
    start = -1
    for event in allEvents
        m = match(r"Guard #([0-9]+) begins shift", event[2])
        if m != nothing
            currentGuard = m[1]
        else
            if occursin(r"falls asleep", event[2])
                start = Dates.minute(event[1])
            else
                if !haskey(guardMap, currentGuard)
                    guardMap[currentGuard] = zeros(1,60)
                end
                #count as asleep the minute they fall asleep, and awake the minute they wake up
                guardMap[currentGuard][start+1 : Dates.minute(event[1])] .+= 1
            end
        end
    end

    #find which guard has the maximum time asleep
    most = -1
    mostGuard = -1
    for (guard, sleepArray) in guardMap
        if maximum(sleepArray) > most
            most = maximum(sleepArray)
            mostGuard = guard
        end
    end

    #find what minute they are asleep the most
    minute = findmax(guardMap[mostGuard])[2][2] - 1 

    #convert the guard value from string to int
    mostGuard = parse(Int, mostGuard)

    #print hashed value
    println("Guard = #$(mostGuard)")
    println("asleep $(most) times")
    println("Minute = $(minute)")
    println("Answer = $(mostGuard * minute)")

end