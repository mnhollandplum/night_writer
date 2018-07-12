require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/braile_dict.rb'
require './lib/decrypt.rb'

class DecryptTest < Minitest::Test

  def test_existence
    decrypt = Decrypt.new
    assert_instance_of Decrypt, decrypt
  end

  def test_dictionary_inverted
    decrypt = Decrypt.new
    result = decrypt.braile_to_eng[["00","00","0."]]
    expected = "q"
    assert_equal expected, result
  end

  def test_takes_input_and_splits
    decrypt = Decrypt.new
    result = decrypt.take_and_split("0.0.0.............")
    expected = ["0.0.0.", "......", "......"]
    assert_equal expected, result
  end

  def test_can_join_to_propper_rows
    decrypt = Decrypt.new
    split = decrypt.take_and_split("0.0.0.............")
    result = decrypt.join_row(split)
    expected = [["0.", "..", ".."], ["0.", "..", ".."], ["0.", "..", ".."]]
    assert_equal expected, result
  end

  def test_translate_dict_value_to_eng
    decrypt = Decrypt.new
    split = decrypt.take_and_split("0.0.0.............")
    characters = decrypt.join_row(split)
    result = decrypt.translate_chars(characters)
    expected = "aaa"
    assert_equal expected, result
  end

  def test_integrated_method
    decrypt = Decrypt.new
    result = decrypt.translate("0.0.0.............")
    expected = "aaa"
    assert_equal expected, result
  end

  # def test_more_than_40_characters
  #   decrypt = Decrypt.new
  #   result = decrypt.translate("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.................................................................................................................................................................0.0.........")
  #   expected = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  #   assert_equal expected, result
  # end
end
