# Multipls two numbers without using *
# 18 24
x = 19
y = 24
p x*y

def add_nums(x, y)
  p "#{x} => #{y}"
  mid = x/2
  extra_nums = 0
  extra_nums += y if x.odd?
  if mid == 1
    extra_nums = 0 if x.even?
    return y + y + extra_nums
  end
  left = add_nums(mid, y)
  return left + left + extra_nums
  # return add_nums(mid, y) + add_nums(mid, y) + extra_nums
end

p add_nums(x, y)