require './lib/braile_dict.rb'
class Encrypt

  attr_reader :to_be_translated_to_braile

  def initialize(to_be_translated_to_braile)
    @to_be_translated_to_braile = to_be_translated_to_braile
    @dict = BraileDict.new
  end

  def take_input_convert_to_array
    @to_be_translated_to_braile.chars
  end

  def converts_per_chars
  single_chars = take_input_convert_to_array
  single_chars.map do |chars|
    @dict.english_to_braile[chars]
  end
  end
end
