class Encrypt

  attr_reader :to_be_translated_to_braile

  def initialize(to_be_translated_to_braile)
    @to_be_translated_to_braile = to_be_translated_to_braile
  end

  def take_input_convert_to_array
    @to_be_translated_to_braile.chars
  end

end
