# Triplets


# Complete the triplets function below.
def triplets(a, b, c)
  
  ai = 0
  bi = 0
  ci = 0
  ans = 0
  
  while bi < b.length
    while ai < a.length && a[ai] <= b[bi]
      ai += 1
    end
    
    while ci < c.length && c[ci] <= b[bi]
      ci += 1
    end
    ans += ai * ci
    bi += 1
  end
  ans  
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

lenaLenbLenc = gets.rstrip.split

lena = lenaLenbLenc[0].to_i

lenb = lenaLenbLenc[1].to_i

lenc = lenaLenbLenc[2].to_i

arra = gets.rstrip.split(' ').map(&:to_i).sort.uniq

arrb = gets.rstrip.split(' ').map(&:to_i).sort.uniq

arrc = gets.rstrip.split(' ').map(&:to_i).sort.uniq

ans = triplets arra, arrb, arrc

fptr.write ans
fptr.write "\n"

fptr.close()
