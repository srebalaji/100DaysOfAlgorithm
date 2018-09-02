#!/bin/ruby

require 'json'
require 'stringio'

# Complete the circularArrayRotation function below.
def circularArrayRotation(a, k, queries)
  b = []
  size = a.length-1

  a.each_with_index do |element, index|
    to_be_index = index + k
    if to_be_index <= size
      # p to_be_index
      b[to_be_index] = element
    else
      compute_index = to_be_index - size-1
      # p compute_index
      while !(compute_index <= size)
        compute_index = compute_index - size-1
      end
      b[compute_index] = element
    end
  end
  # p b
  queries.map{|query| b[query]}
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nkq = gets.rstrip.split

n = nkq[0].to_i

k = nkq[1].to_i

q = nkq[2].to_i

a = gets.rstrip.split(' ').map(&:to_i)

queries = Array.new(q)

q.times do |i|
    queries_item = gets.to_i
    queries[i] = queries_item
end

result = circularArrayRotation a, k, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
