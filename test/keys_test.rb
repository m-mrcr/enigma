require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'

class KeysTest < MiniTest::Test
  def test_it_exists
    keys = Keys.new(82349)

    assert_instance_of Keys, keys
  end

  def test_that_it_initiates_with_empty_keys
    keys = Keys.new(82349)

    expected = {A: 0, B: 0, C: 0, D: 0}

    assert_equal expected, keys.keys
  end

  def test_that_it_can_find_random_number
    keys = Keys.new(87522)

    number = keys.random_number

    expected = (0..99999).to_a.map { |number| "%05d" % number.to_s }

    assert expected.include?(number)
  end

  def test_that_it_can_generate_keys
    number = 0
    keys = Keys.new(number)

    x = (0..99).to_a.map { |number| "%02d" % number }.sample
    keys.generate_keys(number)
    expected = {A: x, B: x, C: x, D: x}

    assert expected[:A].include?(x)
  end

end
