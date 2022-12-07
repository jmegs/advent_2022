$input = <<-EOF
        [M]     [B]             [N]
[T]     [H]     [V] [Q]         [H]
[Q]     [N]     [H] [W] [T]     [Q]
[V]     [P] [F] [Q] [P] [C]     [R]
[C]     [D] [T] [N] [N] [L] [S] [J]
[D] [V] [W] [R] [M] [G] [R] [N] [D]
[S] [F] [Q] [Q] [F] [F] [F] [Z] [S]
[N] [M] [F] [D] [R] [C] [W] [T] [M]
EOF

$moves = File.readlines("moves.txt")

def parse_input(input)
    lines = input.split("\n")
    
    # every 4 chars is either enough blank spaces to get to the next crate, 
    # or a crate with brackets and a separating space. 
    # the second of those 4 chars will either be a letter or a blank space.
    rows = lines.map { |l| l.split("").each_slice(4).to_a.map{ |col| col[1] }}
    
    # have to do it this way to make it multidimensional
    # @see https://ruby-doc.org/core-3.1.2/Array.html#class-Array-label-Creating+Arrays
    stacks = Array.new(rows.first.length) { Array.new(rows.length) }
    
    rows.reverse.each_with_index do |crates, row|
        crates.each_with_index do |crate, column|
            stacks[column][row] = crate
        end
    end
    
    # strips blank spaces
    return stacks.map { |row| row.reject { |el| el == " " } }
end

def parse_move(move) 
    # regex here grabs the digit characters ("\d") out of the move text
    # last map subtracts 1 from positions to get usable array indicies
    move.split(" ").grep(/\d/).map(&:to_i).map.with_index { |n, i| i == 0 ? n : n - 1 }
end

def get_answer(stacks)
    stacks.map(&:last).join("")
end

def part1()
    stacks = parse_input($input)    
    
    $moves.each do |move|
        amount, from, to = *parse_move(move)
        to_move = stacks[from].pop(amount).reverse
        stacks[to].push(*to_move)
    end
    
    get_answer(stacks)
end

def part2()
    stacks = parse_input($input)
    
    $moves.each do |move|
        amount, from, to = *parse_move(move)
        to_move = stacks[from].pop(amount)
        stacks[to].push(*to_move)
    end
    
    get_answer(stacks)
end

puts "Part 1: #{part1()}"
puts "Part 2: #{part2()}"
