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


end
