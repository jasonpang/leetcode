# 338. Counting Bits
# https://leetcode.com/problems/counting-bits/

# Key Insights
# ----------------------------------------------
# - DP problem
# 	- We can borrow bits[0] and bits[1] to make 2, and 3
#   - We can borrow 0 .. 3, to make 4 .. 7

# base: e.g. in 2^64, base is 2
def perfect_square_of?(num, base)
	raise 'Cannot calculate 0' if num == 0
	return true if num == 1
	calc = num
	loop do
		has_remainder = (calc % base) != 0
		#puts "has_remainder: #{has_remainder}"
	 	return false if has_remainder
	 	calc = calc / base
	 	#puts "calc: #{calc}"
	 	break if calc == 1
	end
	return true
end

# num: A decimal number
# We guarantee this method to be called in sequential order from 0 .. inf
def bit_count_for_sequential(num)
	#$stderr.puts "bit_count_for_sequential: num: #{num}"
	return @bits[num] if @bits.key?(num)
	unless @sequence_idx == @sequence_len
		# This decimal number is between perfect squares
		# The number of 1s for its binary form is 1 + a previous memoized answer
		#$stderr.puts "bit_count_for_sequential: @sequence_idx: #{@sequence_idx}"
		#$stderr.puts "bit_count_for_sequential: @bits[@sequence_idx]: #{@bits[@sequence_idx]}"
		answer = 1 + @bits[@sequence_idx]
		@sequence_idx += 1
		#$stderr.puts "bit_count_for_sequential: Final sequence_idx: #{@sequence_idx} / #{@sequence_len}: #{answer}"
	else
		# This decimal number is a perfect square

		# Start sequence_idx from 1, because returning 1 as the perfect square answer is a "move"
		@sequence_idx = 1
		# It just so happens, a perfect square describes the amount of numbers until the next perfect square
		@sequence_len = num
		# The number of 1s for any perfect square's binary form is always 1
		answer = 1
		#$stderr.puts "bit_count_for_sequential: Final sequence_idx: #{@sequence_idx}"
		#$stderr.puts "bit_count_for_sequential: Final sequence_len: #{@sequence_len}"
	end
	# Memoize this answer
	@bits[num] = answer
	answer
end

def count_bits(num)
	# decimal => number of 1s
	# e.g. 7 => 3
	@bits = {
		0 => 0, # Binary number 0 has no one bits
		1 => 1  # Binary number 1 has exactly 1 one bit
	}


	# Starts off with 2, after 0 and 1 which are by default memoized
	@sequence_idx = 0
	@sequence_len = 2
	(num + 1).times.map { |n| bit_count_for_sequential(n) }
end