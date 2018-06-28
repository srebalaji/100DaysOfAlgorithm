# Generate binary search tree

arr = [2,4,6,8,10,12,14,16]

root = (arr.count/2)

# if arr.count.odd?
# 	root = root += 1
# end

# p arr[root]

def nodes(arr)
	length = arr.count

	if length > 3
		root = (length/2)
		p arr[root]
		p "+++++++++"
		p arr.slice(0, (root))
		p arr.slice(root+1, (length - root))
		p "++++++++++++"
		nodes(arr.slice(0, (root)))
		nodes(arr.slice(root+1, (length - root)))
	else
		root = length/2

		if length == 1 || length == 2
			p "root => #{arr[0]}"
			p "right => #{arr[1]}" rescue ""
		else
			p "root => #{arr[1]}"
			p "left => #{arr.first}"
			p "right => #{arr.last}"
		end
		p "--------"
	end
end

nodes(arr)