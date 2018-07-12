require './lib/braile_dict'

class Decrypt

  attr_reader :braile_to_eng

  def initialize
    @braile_to_eng = BraileDict.new.english_to_braile.invert
  end

  def translate(incoming_text)
    split = take_and_split(incoming_text)
    row = join_row(split)
    translation = translate_chars(row)
    return translation
  end

  def take_and_split(chars)
    length_of_incoming = chars.length / 3
    chars.scan(/.{1,#{length_of_incoming}}/)
  end

  def join_row(unsorted)
    sorted_1 = []
    sorted_2 = []
    sorted_3 = []
    unsorted.each do |sym|
      sorted_1 << sym[0..1]
      sorted_2 << sym[2..3]
      sorted_3 << sym[4..5]
    end
    return [sorted_1.flatten,
            sorted_2.flatten,
            sorted_3.flatten]
  end

  def translate_chars(chars)
    translated = []
    chars.each do |character|
      translated << @braile_to_eng[character]
    end
    return translated.join
  end


end
