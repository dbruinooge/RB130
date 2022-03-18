require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'
Minitest::Reporters.use!

class TextTest < Minitest::Test
  def setup
    @sample_file = File.open('sample.txt')
    @sample_text = @sample_file.read
    @text = Text.new(@sample_text)
  end

  def test_swap
    swapped_sample = @sample_text.gsub('a', 'e')
    swapped_text = @text.swap('a', 'e')
    assert_equal(swapped_sample, swapped_text)
  end

  def test_word_count
    expected_count = @sample_text.split.count
    actual_count = @text.word_count
    assert_equal(expected_count, actual_count)
  end

  def teardown
    @sample_file.close
  end

end