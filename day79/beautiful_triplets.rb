# Beautiful Triplets

def beautiful_triplets(d, arr)
	ha = {}
	check = {}
	res = 0
	arr.each do |element|
		if ha.key? element
			ha[element] += 1
		else
			ha[element] = 1
		end

		diff = element - d

		if ha.key? diff
			check[element] = ha[diff]
			res += check[diff] if check.key? diff
		else
		end
	end
	# p ha
	# p check
	res
end

# a = beautiful_triplets(3, [1, 6, 7, 7, 8, 10, 12, 13, 14, 19]) # 1 2 4 5 7 8 10
a = beautiful_triplets(3, [1, 2, 4, 5, 7, 8, 10])
p a
# p a[1]