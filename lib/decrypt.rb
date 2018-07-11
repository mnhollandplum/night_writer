require './lib/braile_dict'

class Decrypt

  attr_reader :braile_to_eng

  def initialize
    @braile_to_eng = BraileDict.new.english_to_braile.invert
  end

end
