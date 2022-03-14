ALPHABET = ('a'..'z').to_a

def file_lines_to_array(filename)
  array = []
  lines = File.open(filename)
  lines.each do |line|
    array << line.chomp
  end
  array
end

def rot13(letter)
  lowercase = (letter.downcase == letter)
  input_index = ALPHABET.index(letter.downcase)
  output_index = (input_index + 13) % 26
  output_letter = ALPHABET[output_index]
  lowercase ? output_letter : output_letter.upcase
end

def decrypt(name)
  result = ''
  name.chars.each do |char|
    if ALPHABET.include?(char.downcase)
      result << rot13(char)
    else
      result << char
    end
  end
  result
end

encrypted_names = file_lines_to_array('encrypted_pioneers.txt')
decrypted_names = encrypted_names.map { |name| decrypt(name) }

puts decrypted_names
