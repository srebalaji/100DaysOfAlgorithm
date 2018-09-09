# Choco Feast

def chocolateFeast(n, c, m)
	result = 0
	wrap = n/c
	result += wrap

	while !(wrap < m)
		result += wrap / m
		wrap = (wrap / m) + (wrap%m)
	end

	result
end

p chocolateFeast(12, 4, 4)