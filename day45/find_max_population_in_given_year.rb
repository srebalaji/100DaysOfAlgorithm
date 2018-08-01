# Find max population in given year

start_year = [12,20,10,01,10,23,13,90,83,75]
end_year = [15,90,98,72,98,82,98,98,99,94]

start_year.sort!
end_year.sort!

p start_year
p end_year

start_year_index = 0
end_year_index = 0
popu = 0
max_pop = 0
max_year = 0

while(start_year_index < start_year.length)
  if start_year[start_year_index] <= end_year[end_year_index]
    popu += 1
    if max_pop < popu
      max_pop = popu
      max_year = start_year[start_year_index]
    end
    start_year_index += 1
  elsif start_year[start_year_index] > end_year[end_year_index]
    popu -= 1
    end_year_index += 1
  end
end

p max_pop
p max_year