require './lib/braile_dict'

class Decrypt

  attr_reader :braile_to_eng

  def initialize
    @braile_to_eng = {
                    ["0....."] => "a",
                    ["0.0..."] => "b",
                    ["00...."] => "c",
                    ["00.0.."] => "d",
                    ["0..0.."] => "e",
                    ["000..."] => "f",
                    ["0000.."] => "g",
                    ["0.00.."] => "h",
                    [".00..."] => "i",
                    [".000.."] => "j",
                    ["0...0."] => "k",
                    ["0.0.0."] => "l",
                    ["00..0."] => "m",
                    ["00.00."] => "n",
                    ["0..00."] => "0",
                    ["000.0."] => "p",
                    ["00000."] => "q",
                    ["0.000."] => "r",
                    [".00.0."] => "s",
                    [".0000."] => "t",
                    ["0...00"] => "u",
                    ["0.0.00"] => "v",
                    [".000.0"] => "w",
                    ["00..00"] => "x",
                    ["00.000"] => "y",
                    ["0..000"] => "z"
                                          }
  end

  def translate(incoming_text)
    split = take_and_split(incoming_text)
    row = join_row(split)
    dict_keys = reform_into_dict_keys(row)
    translation = translate_chars(dict_keys)
    return translation
  end

  def take_and_split(chars)
    length_of_incoming = chars.length / 3
    chars.scan(/.{1,#{length_of_incoming}}/)
  end

  def join_row(unsorted)
    sorted_1 = []
    while unsorted[2].length != 0
      # binding.pry
      sorted_1 << unsorted[0].slice!(0..1)
      if unsorted[2].length == 0
        break
      end
      sorted_1 << unsorted[1].slice!(0..1)
      if unsorted[2].length == 0
        break
      end
      sorted_1 << unsorted[2].slice!(0..1)
      if unsorted[2].length == 0
        break
      end
    end
    return [sorted_1.flatten].flatten.join.scan(/....../)
  end

  def reform_into_dict_keys(braile)
    counter = 0
    braile.map! do |braile|
      braile.split
    end
  end


    # braile.each_with_index do |element, index|
    #   counter = 0
    #   if index == counter
    #     braile_1 << element
    #     counter += 1
    #   end
    #   if index == counter
    #     braile_2 << element
    #     counter += 1
    #   end
    #   if index == counter
    #     braile_3 << element
    #     counter += 1
        #   end
  #   end
  #   return [braile_1, braile_2, braile_3]
  # end


  def translate_chars(chars)
    translated = []
    chars.each do |character|
      translated << @braile_to_eng[character]
    end
    return translated.join
  end


end
