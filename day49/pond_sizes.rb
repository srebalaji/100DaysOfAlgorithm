# Given a N * N matrix, find all the pond sizes.
require 'Set'

matrix = [
[0,2,1,0], 
[0,1,0,1], 
[1,1,0,1], 
[0,1,0,1]]

set = Set.new

def traverse(o_i, i_i, matrix, set)
  index = "#{o_i}#{i_i}"

  return 0 if set.include? index

  return 0 if o_i < 0 || i_i < 0 || o_i > matrix.length-1 || i_i > matrix.length-1

  unless matrix[o_i][i_i] == 0
    set.add("#{o_i}#{i_i}")
    return 0 
  end

  set.add(index)
  return 1 + traverse(o_i-1, i_i, matrix, set) + traverse(o_i, i_i-1, matrix, set) + traverse(o_i+1, i_i, matrix, set) + traverse(o_i, i_i+1, matrix, set) + traverse(o_i+1, i_i-1, matrix, set) + traverse(o_i-1, i_i-1, matrix,set) + traverse(o_i-1, i_i+1, matrix, set) + traverse(o_i+1, i_i+1, matrix, set)
end

matrix.each_with_index do |outer, o_i|
  outer.each_with_index do |inner, i_i|
    index = "#{o_i}#{i_i}"
    if matrix[o_i][i_i] == 0 && !(set.include? index)
      p traverse(o_i, i_i, matrix, set)
    end
  end
end

p set