require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_that_it_initiates_with_a_character_set
    enigma = Enigma.new
    expected = ("a".."z").to_a << " "
    assert_equal expected, enigma.character_set
  end

  def test_that_it_initiates_with_empty_keys
    enigma = Enigma.new
    expected = {A: 0, B: 0, C: 0, D: 0}
    assert_equal expected, enigma.keys
  end

  def test_that_it_initiates_with_empty_offsets
    enigma = Enigma.new
    expected = {A: 0, B: 0, C: 0, D: 0}
    assert_equal expected, enigma.offsets
  end

  def test_that_it_can_generate_keys
    enigma = Enigma.new

    expected = {A: 02, B: 27, C: 71, D: 15}

    assert_equal expected, enigma.generate_keys(02715)
  end

  def test_it_can_encrypt_a_message
    skip
    enigma = Enigma.new

    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end



end
