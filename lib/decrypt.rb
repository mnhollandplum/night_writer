require './lib/braile_dict'

class Decrypt

  attr_reader :braile_to_eng

  def initialize
    @braile_to_eng = BraileDict.new.english_to_braile.invert
  end

  def take_and_split(chars)
    length_of_incoming = chars.length / 3
    binding.pry
    chars.scan(/.{1,#{length_of_incoming}}/)
  end
end
