require 'pry'
require './lib/braile_dict.rb'
class Encrypt

  attr_reader :to_be_translated_to_braile,
              :dict,
              :row_1,
              :row_2,
              :row_3,
              :excess


  def initialize(to_be_translated_to_braile)
    @to_be_translated_to_braile = to_be_translated_to_braile
    @dict = BraileDict.new
    @row_1 = []
    @row_2 = []
    @row_3 = []
    @excess = []

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
    variable =converts_per_chars
    variable.each do |braile|
    @row_1 << braile[0]
    @row_2 << braile[1]
    @row_3 << braile[2]
    end
    return [@row_1, @row_2, @row_3]
  end







end
