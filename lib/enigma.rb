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

end
