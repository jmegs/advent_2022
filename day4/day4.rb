test_case = <<-EOF.chomp.split("\n")
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
EOF

input = File.readlines("input.txt")

def parse(input)
    input.map { |pair| pair.gsub("-", ",").split(",").map(&:to_i) }
end

def fully_contains? (a_start, a_end, b_start, b_end)
    (a_start <= b_start && a_end >= b_end) or (b_start <= a_start && b_end >= a_end) ? 1 : 0
end

def overlaps? (a_start, a_end, b_start, b_end)
    (a_start <= b_end && a_end >= b_start) or (b_start <= a_end && b_end >= a_start) ? 1 : 0
end

part1 = parse(input).map{ |pair| fully_contains? *pair }.sum
part2 = parse(input).map{ |pair| overlaps? *pair }.sum

puts "part1: #{part1}"
puts "part2: #{part2}"