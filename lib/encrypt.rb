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
    @to_be_translated_to_braile.chars
    if @to_be_translated_to_braile.length > 40
      @excess << @to_be_translated_to_braile.slice(40..-1).chars
    else
      return @to_be_translated_to_braile.chars
    end
  end

  def converts_per_chars
    single_chars = take_input_convert_to_array
    single_chars.map do |chars|
    @dict.english_to_braile[chars]
    end
  end

<<<<<<< HEAD





  # def splits_rows
  #   single_chars = take_input_convert_to_array
  #   joined_rows = converts_per_chars
  #   if joined_rows.length > 80
  #     @excess_rows << joined_rows.slice(-1..80)
  #   else
  #     joined_rows
  #   end
  #
  #   @row_1 << single_chars.map do |chars| "#{@dict.english_to_braile[chars][0]}"
  #   end.join
  #   @row_2 << single_chars.map do |chars| "#{@dict.english_to_braile[chars][1]}"
  #   end.join
  #   @row_3 << single_chars.map do |chars| "#{@dict.english_to_braile[chars][2]}"
  #   end.join
  #
  # end
  #
  # def braile_row
  #   [@row_1, @row_2, @row_3].join("\n")
  # end
  #
  #
=======
  #
  def splits_rows
    single_chars = take_input_convert_to_array
    converts_per_chars
    single_chars.map do |array|
    @row_1 << single_chars.map do |chars|
      "#{@dict.english_to_braile[chars][0]}"
     @row_2 << single_chars.map do |chars|
      "#{@dict.english_to_braile[chars][1]}"
    end.join
    @row_3 << single_chars.map do |chars|
      "#{@dict.english_to_braile[chars][2]}"
    end.join
    [@row_1, @row_2, @row_3]

  end
end
>>>>>>> 90b44dc9c1859389ab9d86edf451f9a604ee05a1



end
