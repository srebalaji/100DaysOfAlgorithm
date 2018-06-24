# Delete the middle node in the linked list.

# Considering ruby array as linked list. So we don't know the linked list size or else we cant find the element by index.

list = []

puts "Enter the list size"
n = gets.chomp.to_i

(1..n).each do
	list << gets.chomp.to_i
end

puts "List => #{list}"

counter = 0
find_counter = 0
flag = 0

list = list.to_enum

loop do
	node = list.next rescue nil
	break if node.nil?
	unless node.nil?
		counter += 1
	end
end

middle_element = (counter / 2.to_f).ceil
# puts "Count => #{counter}"
# puts "Middle element => #{middle_element}"

list = list.to_enum

loop do
	node = list.next rescue nil
	break if node.nil?
	find_counter += 1

	if middle_element.even?
		if middle_element == find_counter || (middle_element+1) == find_counter
			if find_counter != 1 && find_counter != counter
				puts "Element position => #{find_counter}"
				puts "found middle node"
				flag = 1
				break
			end
		end
		if (middle_element + 1) == find_counter
			if find_counter != 1 && find_counter != counter
				puts "Element position => #{find_counter}"
				puts "found middle node"
				flag = 1
				break
			end
		end
	else
		if middle_element == find_counter
			if find_counter != 1 && find_counter != counter
				puts "Element position => #{find_counter}"
				puts "found middle node"
				flag = 1
				break
			end
		end
	end
end

if flag == 0
	puts "No middle element found"
end

