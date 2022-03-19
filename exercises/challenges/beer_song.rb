class BeerSong
  def self.verse(verse_number)
    if verse_number.zero?
      zero_verse
    else
      "#{bottles(verse_number)} of beer on the wall, "\
      "#{bottles(verse_number)} of beer.\n"\
      "Take #{verse_number == 1 ? 'it' : 'one'} down and pass it around, "\
      "#{bottles(verse_number - 1)} of beer on the wall.\n"
    end
  end

  def self.verses(first_verse, last_verse)
    result = ''
    first_verse.downto(last_verse) do |current_verse|
      result << (current_verse.zero? ? zero_verse : verse(current_verse))
      result << "\n" unless current_verse == last_verse
    end
    result
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def bottles(verse_number)
      case verse_number
      when 1
        "#{verse_number} bottle"
      when 0
        "no more bottles"
      else
        "#{verse_number} bottles"
      end
    end

    def zero_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
