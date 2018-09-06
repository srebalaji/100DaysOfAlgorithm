# Halloween Sale

def howManyGames(p,d,m,s)
	count = 0
	sum = 0
	cost = p

	loop do
		if sum+cost <= s
			sum += cost
			count += 1
		else
			break
		end
		if cost-d < m
			cost = m
		else
			cost -= d
		end
		
	end
	count
end

p howManyGames(20, 3, 6, 85)