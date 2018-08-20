# Minimum absolute difference

# Complete the minimumAbsoluteDifference function below.
def minimumAbsoluteDifference(arr)
  arr.sort!
  inc = 0
  small = nil
  loop do
    break if inc == arr.length-1
    # p (arr[inc] - arr[inc+1]).abs
    if small.nil? || (arr[inc] - arr[inc+1]).abs < small
      small = (arr[inc] - arr[inc+1]).abs
    end
    inc += 1
  end
  small
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = minimumAbsoluteDifference arr

fptr.write result
fptr.write "\n"

fptr.close()
