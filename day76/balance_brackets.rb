#!/bin/ruby

require 'json'
require 'stringio'

def balance_expression(expression)
  stack = []
  str = expression

  str.split("").each do |element|
    if element == "[" || element == "{" || element == "("
      stack << element
    else
      peek_element = stack.last
      if element == "]"  
        if peek_element == "["
          stack.pop
        else
          return "NO"
        end
      elsif element == "}"
        if peek_element == "{"
          stack.pop 
        else
          return "NO"
        end
      elsif element == ")"
        if peek_element == "("
          stack.pop 
        else
          return "NO"
        end
      end
    end
    # p stack
    # p "===="
  end
  # puts "STack #{stack}"
  return 'YES' if stack.empty?
  return 'NO'
end


t = gets.to_i

t.times do |t_itr|
    expression = gets.to_s.rstrip
    puts balance_expression(expression)
end
