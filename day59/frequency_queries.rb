# Frequency Queries

def add_frequency(ha, element)
  if ha.key? element
    ha[element] += 1
  else
    ha[element] = 1
  end
end

def remove_frequency(ha, element)
  return unless ha.key? element
  if ha[element] > 1
    ha[element] -= 1
  else
    ha.delete(element)
  end
end

def insert_element(ha, input, frequency)
  if ha.key? input
    remove_frequency(frequency, ha[input])
    ha[input] += 1
    add_frequency(frequency, ha[input])
  else
    ha[input] = 1
    add_frequency(frequency, 1)
  end
end

def delete_element(ha, input, frequency)
  return unless ha.key? input
  if ha[input] > 1
    remove_frequency(frequency, ha[input])
    ha[input] -= 1
    add_frequency(frequency, ha[input])
  else
    ha.delete(input)
    remove_frequency(frequency, 1)
  end
end

def return_frequency(ha, input, frequency)
  if frequency.key? input
    1
  else
    0
  end
end

# Complete the freqQuery function below.
def freqQuery(queries)
  ha = {}
  frequency = {}
  output = []
  queries.each do |query|
    in_query = query[0]
    input = query[1]
    case in_query
    when 1
      insert_element(ha, input, frequency)
    when 2
      delete_element(ha, input, frequency)
    when 3
      output << return_frequency(ha, input, frequency)
    end
  end
  output
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

queries = Array.new(q)

q.times do |i|
    queries[i] = gets.rstrip.split.map(&:to_i)
end

ans = freqQuery queries

fptr.write ans.join "\n"
fptr.write "\n"

fptr.close()
