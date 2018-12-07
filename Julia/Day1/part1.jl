#starts from 0 and adds/subtracts based on the input file

open("input.txt") do file
    val = 0
    for line in eachline(file)
        # println(line)
        if line[1] == '+'
            val += parse(Int, line[2:end])
        else
            val -= parse(Int, line[2:end])
        end

    end

    println("\n\n Final answer: $(val)")
end


