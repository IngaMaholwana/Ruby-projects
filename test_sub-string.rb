require "minitest/autorun"
require_relative "sub-string" # Includes the code from sun-string.rb

class TestSubstrings < Minitest::Test
  def setup
    @dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
  end

  def test_count_presence
    assert_equal 1, count_presence("below", "low")
    assert_equal 2, count_presence("howdy partner, sit down! how's it going?", "how")
    assert_equal 0, count_presence("hello world", "bye")
    assert_equal 1, count_presence("Howdy Partner", "partner")
  end

  def test_substrings_single_word
    expected = { "below" => 1, "low" => 1 }
    assert_equal expected, substrings("below", @dictionary)
  end

  def test_substrings_multiple_words
    input = "Howdy partner, sit down! How's it going?"
    expected = { 
      "down" => 1, "how" => 2, "howdy" => 1, 
      "it" => 2, "i" => 3, "own" => 1, 
      "part" => 1, "partner" => 1, "sit" => 1, "go" => 1, "going" => 1 
    }
    assert_equal expected, substrings(input, @dictionary)
  end

  def test_substrings_empty_string
    assert_equal({}, substrings("", @dictionary))
  end

  def test_substrings_no_matches
    input = "abcdefg"
    assert_equal({}, substrings(input, @dictionary))
  end
end
