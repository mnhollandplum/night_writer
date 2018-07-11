require 'pry'
require './lib/braile_dict.rb'
class Encrypt

  attr_reader :dict,
              :row_1,
              :row_2,
              :row_3


  def initialize
    @dict = BraileDict.new
    @row_1 = []
    @row_2 = []
    @row_3 = []
  end

  def translate(message)
    array = take_input_convert_to_array(message)
    converted = converts_per_chars(array)
    split_rows(converted)
    print_rows_to_file
  end

  def take_input_convert_to_array(to_be_translated_to_braile)
    to_be_translated_to_braile.chars
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


  def print_rows_to_file
    printable_row_1 = []
    printable_row_2 = []
    printable_row_3 = []
    while @row_3[0] != nil
      string_1 = ""
      string_2 = ""
      string_3 = ""
      40.times do |i|
        if @row_1[0] == nil
          break
        else
        string_1 << @row_1.shift
      end
      end
      printable_row_1 << string_1
      40.times do |i|
        if @row_2[0] == nil
          break
        else
        string_2 << @row_2.shift
      end
      end
      printable_row_2 << string_2
      40.times do |i|
        if @row_3[0] == nil
          break
        else
        string_3 << @row_3.shift
      end
      end
      printable_row_3 << string_3
    end
    return [printable_row_1[0],
            printable_row_2[0],
            printable_row_3[0],
            printable_row_1[1],
            printable_row_2[1],
            printable_row_3[1]].join("\n")
    end

end
