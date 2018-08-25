# Apple and orange

#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countApplesAndOranges function below.
def countApplesAndOranges(s, t, a, b, apples, oranges)
  apples.map!{|element| element + a}
  oranges.map!{|element| element + b}
  apples_count = apples.select{|element| element >= s && element <= t}
  oranges_count = oranges.select{|element| element >= s && element <= t}
  # p apples
  # p apples_count
  puts apples_count.count
  puts oranges_count.count
end

st = gets.rstrip.split

s = st[0].to_i

t = st[1].to_i

ab = gets.rstrip.split

a = ab[0].to_i

b = ab[1].to_i

mn = gets.rstrip.split

m = mn[0].to_i

n = mn[1].to_i

apples = gets.rstrip.split(' ').map(&:to_i)

oranges = gets.rstrip.split(' ').map(&:to_i)

countApplesAndOranges s, t, a, b, apples, oranges
