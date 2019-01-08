class Enigma

  attr_reader :character_set
              :keys

  def initialize
    @character_set = ("a".."z").to_a << " "
    @keys = {A: 0, B: 0, C: 0, D: 0}
  end

end
