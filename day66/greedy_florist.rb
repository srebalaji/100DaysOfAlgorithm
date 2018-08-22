# Greedy Florist

arr = [1, 3, 5, 7, 9]
k = 3

arr.sort!
start = arr.length-1
inc = 1
mul = 1
ans = 0

loop do
	break if start < 0
	element = arr[start]
	if inc <= k
		ans += element * mul
		inc += 1
		start -= 1
	else
		inc = 1
		mul += 1
	end
	
end
p ans