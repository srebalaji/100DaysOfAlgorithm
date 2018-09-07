# flatland space stations.

def flatlandSpaceStations(n, c)
	c.sort!
	max_diff = nil

	(0..n-1).each do |element|
		next if c.include? element
		min = nil
		c.each do |con|
			diff = (element - con).abs
			min = diff if min.nil? || min > diff
		end
		max_diff = min if max_diff.nil? || min > max_diff
	end
	max_diff || 0
end

p flatlandSpaceStations(5, [0, 4])



# c.sort!
# 	max_diff = nil

# 	(0..n-1).each do |element|
# 		next if c.include? element
# 		min = nil
# 		c.each do |con|
# 			diff = (element - con).abs
# 			min = diff if min.nil? || min > diff
# 		end
# 		max_diff = min if max_diff.nil? || min > max_diff
# 	end
# 	max_diff || 0