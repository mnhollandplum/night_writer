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

  def splits_string_to_3_rows
    row_1 = []
    row_2 = []
    row_3 = []
    braile_translation_1 = converts_per_chars
    braile_translation_1.each do |braile|
      while braile != "" do
      row_1 << braile.slice(0..1)
      row_2 << braile.slice(0..1)
      row_3 << braile.slice(0..1)
                        end
                      end
                  
    return row_1, row_2, row_3
  end

end
