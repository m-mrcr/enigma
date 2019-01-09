require 'date'
class Enigma

  attr_reader :character_set,
              :keys,
              :offsets

  def initialize
    @character_set = ("a".."z").to_a << " "
    @keys = {A: 0, B: 0, C: 0, D: 0}
    @offsets = {A: 0, B: 0, C: 0, D: 0}
    @shifts = {}
  end

  def generate_keys(number)
  number = number.to_s.split('')
    @keys.each do |letter, num|
      @keys[letter] = number.slice(0..1).join.to_i
      number.shift
    end
  end

  def generate_offsets(date)
    date = date.to_i
    squared = (date ** 2).to_s[-4..-1].split('')
    @offsets.each do |letter, number|
      @offsets[letter] = squared[0].to_i
      squared.shift.to_i
    end
  end

  def generate_shifts(keys, offsets)
    generate_keys(keys)
    generate_offsets(offsets)
    @shifts = @keys.merge(@offsets) do |position, keys_number, offsets_number|
      keys_number.to_i + offsets_number.to_i
    end
  end

  def generate_index_setting(string)
    index_set = { A: [], B: [], C: [], D: [] }
    initial_index = 0
    all_indexes = (initial_index..string.length).to_a
    index_set.each do |letter, setting|
      all_indexes.each do |number|
        index_set[letter] << number
        3.times {all_indexes.shift}
      end
      initial_index += 1
      all_indexes = (initial_index..string.length).to_a
    end
    return index_set
  end
  
end
