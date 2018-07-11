require 'pry'
require './lib/braile_dict.rb'
class Encrypt

  attr_reader :to_be_translated_to_braile,
              :dict,
              :row_1,
              :row_2,
              :row_3,
              :row_4,
              :row_5,
              :row_6,
              :excess


  def initialize
    @dict = BraileDict.new
    @row_1 = []
    @row_2 = []
    @row_3 = []
    @row_4 = []
    @row_5 = []
    @row_6 = []
    @excess = []

  end

  def translate(to_be_translated_to_braile)
    @to_be_translated_to_braile = to_be_translated_to_braile
    take_input_convert_to_array
    converts_per_chars
    split_rows
    translate_and_format_excess
  end

  def take_input_convert_to_array
    if @to_be_translated_to_braile.length > 40
      @excess << @to_be_translated_to_braile.slice(40..-1).chars
    else
      return @to_be_translated_to_braile.chars
    end
  end

  def converts_per_chars
    take_input_convert_to_array.map do |chars|
    @dict.english_to_braile[chars]
    end
  end

  def split_rows
    converts_per_chars.each do |braile|
    @row_1 << braile[0]
    @row_2 << braile[1]
    @row_3 << braile[2]
    end
    return [@row_1, @row_2, @row_3].compact
  end

  def translate_and_format_excess
    translated = []
    @excess.flatten.each do |letter|
      translated << @dict.english_to_braile[letter]
    end
    translated.each do |braile|
      @row_4 << braile[0]
      @row_5 << braile[1]
      @row_6 << braile[2]
    end
    return [@row_4, @row_5, @row_6]
  end

end
