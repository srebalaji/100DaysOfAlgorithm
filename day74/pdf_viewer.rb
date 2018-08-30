# Pdf viewer

# Complete the designerPdfViewer function below.
def designerPdfViewer(h, word)
  max_height = nil
  word.split("").each do |char|
    height = h[char.ord-97]
    max_height = height if max_height.nil? || max_height < height
  end
  return max_height * word.length
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

h = gets.rstrip.split(' ').map(&:to_i)

word = gets.to_s.rstrip

result = designerPdfViewer h, word

fptr.write result
fptr.write "\n"

fptr.close()
