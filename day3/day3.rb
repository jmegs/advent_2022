test = "vJrwpWtwJgWrhcsFMMfFFhFp"
input = File.readlines("input.txt", chomp: true)

def get_priority(char)
    lower_offset = 96
    upper_offset = 38
    
    if char.ord < 97
        return char.ord - upper_offset
    else
        return char.ord - lower_offset
    end
end


def part1(input)
    result = 0
    input.each do |line|
        c1, c2 = line.split('').each_slice((line.size / 2).round).to_a
        common = c1.intersection(c2).first.to_s
        result += get_priority(common)
    end
    return result
end

def part2(input)
    result = 0
    input.each_slice(3) do |group|
        group = group.map { |line| line.split('') }
        common = group.first.intersection(*group.drop(1)).first.to_s
        result += get_priority(common)
    end
    return result
end

puts "part1: #{part1(input)}"
puts "part2: #{part2(input)}"
