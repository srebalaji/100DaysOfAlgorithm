# Given a tic toc toe game, write a function to find whether any player has won the game or not.

matrix = [
[0,1,1], 
[1,0,0], 
[1,0,0]]

size = 3

def hasEqual(p1, p2, p3)
  return p1 == p2 && p2 == p3
end

def hasWon(size, matrix)
  (0..size-1).each do |inc|
    if hasEqual(matrix[inc][0], matrix[inc][1], matrix[inc][2])
      p matrix[inc][0]
    end

    if hasEqual(matrix[0][inc], matrix[1][inc], matrix[2][inc])
      p matrix[0][inc]
    end

    if hasEqual(matrix[0][0], matrix[1][1], matrix[2][2])
      p matrix[0][0]
    end

    if hasEqual(matrix[0][2], matrix[1][1], matrix[2][0])
      p matrix[0][2]
    end
  end
end

hasWon(size, matrix)