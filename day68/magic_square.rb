# Magic Square

s = [4,5,8,2,4,1,1,9,7]

b1 = s[0..2]
b2 = s[3..5]
b3 = s[6..8]

x1 = b1.first + b2.first + b3.first
x2 = b1[1] + b2[1] + b3[1]
x3 = b1.last + b2.last + b3.last

a1 = b1.inject(:+)
a2 = b2.inject(:+)
a3 = b3.inject(:+)

p a1
p a2
p a3
p "===="
p x1
p x2
p x3

ans = 0
if a1 != 15
	diff = 15 - a1
	if x1 + diff == 15
		ans += (diff).abs
		x1 = 15
	elsif x2 + diff == 15
		ans += (diff).abs
		x2 = 15
	else
		ans += (diff).abs
		x3 = 15
		a1 = 15
	end
	p "Diff => #{diff}"
end

if a2 != 15
	diff = 15 - a2
	if x1 + diff == 15
		ans += (diff).abs
		x1 = 15
		a2 = 15
	elsif x2 + diff == 15
		ans += (diff).abs
		x2 = 15
		a2 = 15
	else
		ans += (diff).abs
		x3 = 15
		a2 = 15
	end
	p "Diff => #{diff}"
end

if a3 != 15
	diff = 15 - a3
	if x1 + diff == 15
		ans += (diff).abs
		x1 = 15
		a3 = 15
	elsif x2 + diff == 15
		ans += (diff).abs
		x2 = 15
		a3 = 15
	else
		ans += (diff).abs
		x3 = 15
		a3 = 15
	end
	p "Diff => #{diff}"
end

p "==== ==== ===== ==== ==="

p ans