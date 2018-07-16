# Find path in the given maze.

@maze = [[1,0,1,1], [1,1,1,1], [1,1,0,1], [1,0,1,1]]

@end_x = 3
@end_y = 3

p @maze

@path = []
@cache = {}

def backtrack(x, y)
	return false if x < 0 || y < 0 || @maze[x][y] == 0
	return @cache["#{x}:#{y}"] if @cache.key?("#{x}:#{y}")
	is_reached = false
	if backtrack(x-1, y) || backtrack(x, y-1) || (x == 0 && y == 0)
		@path << [x, y]
		is_reached = true
	end
	@cache["#{x}:#{y}"] = is_reached
	return is_reached
end

backtrack(@end_x, @end_y)
p @path
