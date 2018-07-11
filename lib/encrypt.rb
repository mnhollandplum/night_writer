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

  def translate(message)
    array = take_input_convert_to_array(message)
    converted = converts_per_chars(array)
    split_rows(converted)
    print_rows_to_file
    # translate_and_format_excess
  end

  def take_input_convert_to_array(to_be_transalted_to_braile)
    if to_be_transalted_to_braile.length > 40
      @excess << to_be_transalted_to_braile.slice(40..-1).chars
      return to_be_translated_to_braile
    else
      return to_be_transalted_to_braile.chars
    end
  end

  def converts_per_chars(array)
    array.map do |chars|
    @dict.english_to_braile[chars]
    end
  end

  def split_rows(converted)
    converted.each do |braile|
    @row_1 << braile[0]
    @row_2 << braile[1]
    @row_3 << braile[2]
    end
    return [@row_1, @row_2, @row_3]
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

  def print_rows_to_file
    if @row_4 == []
      [@row_1, "\n", @row_2, "\n", @row_3].join
    else
      [@row_1, "\n", @row_2, "\n", @row_3, "\n", @row_4, "\n", @row_5, "\n", @row_6].join
    end

  end

end
