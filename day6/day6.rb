$input = File.read("input.txt")

def find_marker(buffer, marker_size)
	marker_index = buffer.split("").each_cons(marker_size).to_a.find_index{|chunk| chunk.uniq == chunk}
	num_chars = marker_index + marker_size
	return num_chars
end

puts "Part 1: #{find_marker($input, 4)}"
puts "Part 2: #{find_marker($input, 14)}"
