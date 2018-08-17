# Largest Rectangle


def get_from_right(arr, element)
  
  count = 0
  arr.each do |a|
    if a >= element
      count += 1
    else
      break
    end
  end
  # p "-- #{test}-- =>  #{count} == #{element}"
  count
end



# Complete the largestRectangle function below.
def largestRectangle(h)
  max = 0
  h.each_with_index do |element, index|
    height = 0
    # height += 1
    height += get_from_right(h[index..h.length], element)
    if index-1 >= 0
      height += get_from_right(h[0..index-1].reverse, element)
    end
    height *= element
    # p height
    # p "============"
    if max < height
      max = height
    end
  end
  max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

h = gets.rstrip.split(' ').map(&:to_i)

result = largestRectangle h

fptr.write result
fptr.write "\n"

fptr.close()
