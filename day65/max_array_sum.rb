# Max Array Sum

arr = [3, 5, -7, 8, 10]


def maxSubset(arr, index)

	inc = index + 2

	max_arr = []
	if inc < arr.length
		(inc..arr.length-1).each do |element_i|
			max_arr << arr[index] + maxSubset(arr, element_i)
		end
		return max_arr.max
	else
		return arr[index]
	end

end

max_arr = []
(0..arr.length-1).each do |index|
	max_arr << maxSubset(arr, index)
end
p max_arr.max