# Service lane

# Complete the serviceLane function below.
def serviceLane(n, cases, width)
  result = []
  cases.each do |case_e|
    p case_e
    p case_e[0]
    p case_e[1]
    # p n[case_e[0]..case_e[1]]
    result << width[case_e[0]..case_e[1]].min
  end
  result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nt = gets.rstrip.split

n = nt[0].to_i

t = nt[1].to_i

width = gets.rstrip.split(' ').map(&:to_i)

cases = Array.new(t)

t.times do |i|
    cases[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = serviceLane n, cases, width

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
