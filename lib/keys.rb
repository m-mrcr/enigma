class Keys

  attr_reader :keys

  def initialize(number)
    @keys = {A: 0, B: 0, C: 0, D: 0}
  end

  def random_number
    number = rand(99999)
    "%05d" % number.to_s
  end

  def generate_keys(number)
      number = number.to_s.split('')
      @keys.each do |letter, num|
        @keys[letter] = number.slice(0..1).join.to_i
        number.shift
      end
  end



end
