require 'simplecov'
SimpleCov.start
require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
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

    expected = {A: 87, B: 75, C: 52, D: 22}

    assert_equal expected, enigma.generate_keys("87522")
  end

  def test_that_it_can_generate_offsets
    enigma = Enigma.new

    expected = ["8", "4", "0", "0"]

    assert_equal expected, enigma.generate_offsets("121220")
  end


  # def test_it_can_encrypt_a_message
  #   enigma = Enigma.new
  #
  #   expected = { encryption: "keder ohulw",
  #                key: "02715",
  #                date: "040895"
  #              }
  #
  #   assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  # end

end
