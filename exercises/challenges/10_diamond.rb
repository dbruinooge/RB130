class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(input_letter)
    @height = LETTERS.index(input_letter.upcase)
    @letters = build_letter_array
    draw_top + draw_bottom
  end

  class << self
    private

    def draw_top
      result = ''
      @height.downto(0) do |distance|
        result << draw_line(distance)
      end
      result
    end

    def draw_bottom
      return '' if @height == 0
      result = ''
      1.upto(@height) do |distance|
        result << draw_line(distance)
      end
      result
    end

    def draw_line(distance)
      letter = @letters.shift
      if distance == @height
        draw_single_letter_line(distance, letter)
      else
        "#{' ' * distance}#{letter}#{' ' * middle_spaces(letter)}"\
        "#{letter}#{' ' * distance}\n"
      end
    end

    def draw_single_letter_line(distance, letter)
      "#{' ' * distance}#{letter}#{' ' * distance}\n"
    end

    def build_letter_array
      result = []
      0.upto(@height) { |idx| result << LETTERS[idx] }
      (@height - 1).downto(0) { |idx| result << LETTERS[idx] }
      result
    end

    def middle_spaces(letter)
      result = 1
      2.upto(LETTERS.index(letter)) { result += 2 }
      result
    end
  end
end
