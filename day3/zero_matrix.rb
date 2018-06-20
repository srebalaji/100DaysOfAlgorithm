# Zero Matrix
# For every element that equals to zero, make the entire row and column zero. 

matrix = [[4,2,0], [5,1,8], [7,1,0]]
p matrix
length = matrix.length

matrix.each_with_index do |arr, index1|
	arr.each_with_index do |a, index2|
		if a == 0
			arr.map! {|val| val = 'x' unless val == 0}
			matrix.map { |val| val[index2] = 'x' unless val[index2] == 0}
		end
	end
end
matrix.each_with_index do |arr, index1|
	arr.each_with_index do |a, index2|
		print "#{matrix[index1][index2] == 'x' ? 0 : matrix[index1][index2]} "
	end
	puts "\n" 
end