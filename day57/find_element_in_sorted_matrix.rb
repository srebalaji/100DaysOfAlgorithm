# Given a sorted matrix, find the element.

ar = [
[15,20,70,85],
[25,35,80,95],
[30,55,95,105],
[40,80,120,120]]

element = 40

def binary_search(ar, element)
	mid = ar.length / 2
	# p ar[mid]
	return mid if ar[mid] == element
	return nil if ar[mid].nil?

	if ar[mid] > element
		return binary_search(ar[0..mid-1], element)
	else
		return binary_search(ar[mid+1..ar.length-1], element)
	end
end

ans = []
ar.each_with_index do |arr, index|
	ans[0], ans[1] = binary_search(arr, element), index
	break unless ans[0].nil?
end
puts "#{ans[1]}, #{ans[0]}"