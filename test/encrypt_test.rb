require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_existence
    encryptor = Encrypt.new("hello")
    assert_instance_of Encrypt, encryptor
  end

  def test_it_can_take_input_and_chars
    encryptor = Encrypt.new("hello")
    result = encryptor.take_input_convert_to_array
    assert_equal ["h", "e", "l", "l", "o"], result
  end
#
  def test_it_takes_excess_chars
    encryptor = Encrypt.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    encryptor.take_input_convert_to_array
    result = encryptor.excess
    assert_equal [["a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]], result
  end
#
  def test_it_can_convert_chars
    encryptor = Encrypt.new("hello")
    result = encryptor.converts_per_chars
    assert_equal [["0.","00",".."], ["0.",".0",".."], ["0.","0.","0."], ["0.","0.","0."], ["0.",".0","0."]], result
  end

  def test_it_can_take_first_row_chars
    encryptor = Encrypt.new("a")
    expected = "0."
    actual = encryptor.dict.english_to_braile["a"][0]
    assert_equal expected, actual
  end

  def test_it_can_make_rows
    encryptor = Encrypt.new("a")
    encryptor.split_rows
    actual = encryptor.row_1
    expected = ["0."]
    assert_equal expected, actual
    actual = encryptor.row_2
    expected = [".."]
    assert_equal expected, actual
    actual = encryptor.row_3
    expected = [".."]
    assert_equal expected, actual
  end
#
#   def test_it_can_hold_multiple_letters_in_rows
#     skip
#     encryptor = Encrypt.new("aa")
#     encryptor.converts_per_chars
#     encryptor.splits_rows
#     actual = encryptor.row_1
#     expected = ["0.0."]
#     assert_equal expected, actual
#     actual = encryptor.row_2
#     expected = ["...."]
#     assert_equal expected, actual
#     actual = encryptor.row_3
#     expected = ["...."]
#     assert_equal expected, actual
#   end
#
#   def test_merged_to_braile_rows
#     skip
#     encryptor = Encrypt.new("aa")
#     encryptor.splits_rows
#     actual = encryptor.braile_row
#     expected = "0.0.\n....\n...."
#     assert_equal expected, actual
#   end
#
#   def test_excess_rows
#     encryptor = Encrypt.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#     encryptor.splits_rows
#     encryptor.braile_row
#     actual = encryptor.excess_rows
#     expected = ["0....."]
#   end
#
#   def test_chars_limit_per_row
#     skip
#     encryptor = Encrypt.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#     encryptor.splits_rows
#     encryptor.braile_row
#     actual = encryptor.chars_limit
#     expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n........................................\n........................................\n0....."
#     assert_equal expected, actual
#   end
end
