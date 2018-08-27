#Kangaroo

# Complete the kangaroo function below.
def kangaroo(x1, v1, x2, v2)
  # return v2<v1 && !((x2-x1) % (v1-v2)) ? "YES" : "NO"
  # p (x2-x1)
  # p (v1-v2)
  if (((x2-x1) % (v1-v2)) rescue -1) == 0 && v2 < v1
    return "YES"
  else
    return "NO"
  end

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

x1V1X2V2 = gets.rstrip.split

x1 = x1V1X2V2[0].to_i

v1 = x1V1X2V2[1].to_i

x2 = x1V1X2V2[2].to_i

v2 = x1V1X2V2[3].to_i

result = kangaroo x1, v1, x2, v2

fptr.write result
fptr.write "\n"

fptr.close()
