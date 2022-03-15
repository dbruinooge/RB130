# My solution, which fails to close files
# and invokes `read` in the block instead of the method:

class TextAnalyzer
  def process
    yield(File.new('sample_text.txt'))
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.read.split("\n\n").size} paragraphs" }
analyzer.process { |file| puts "#{file.readlines.size} lines" }
analyzer.process { |file| puts "#{file.read.split(' ').size} words" }

# LS solution:

class TextAnalyzer
  def process
    file = File.new('sample_text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").size} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").size} lines" }
analyzer.process { |file| puts "#{file.split(' ').size} words" }
