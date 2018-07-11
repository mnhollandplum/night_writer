require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_existence
    encryptor = Encrypt.new
    assert_instance_of Encrypt, encryptor
  end

  def test_it_can_take_input_and_chars
    encryptor = Encrypt.new
    result = encryptor.take_input_convert_to_array("hello")
    assert_equal ["h", "e", "l", "l", "o"], result
  end
#
  def test_it_takes_excess_chars
    encryptor = Encrypt.new
    encryptor.take_input_convert_to_array("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    result = encryptor.excess
    assert_equal [["a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]], result
  end
#
  def test_it_can_convert_chars
    encryptor = Encrypt.new
    result = encryptor.converts_per_chars("hello")
    assert_equal [["0.","00",".."], ["0.",".0",".."], ["0.","0.","0."], ["0.","0.","0."], ["0.",".0","0."]], result
  end

  def test_it_can_take_first_row_chars
    encryptor = Encrypt.new("a")
    expected = "0."
    actual = encryptor.dict.english_to_braile["a"][0]
    assert_equal expected, actual
  end

  def test_it_can_make_rows
    encryptor = Encrypt.new
    encryptor.split_rows([["0."],[".."],[".."]])
    binding.pry
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

  def test_it_can_hold_multiple_letters_in_rows
    encryptor = Encrypt.new
    v = encryptor.converts_per_chars(["a", "a"])
    encryptor.split_rows(v)
    actual = encryptor.row_1
    expected = ["0.", "0."]
    assert_equal expected, actual
    actual = encryptor.row_2
    expected = ["..", ".."]
    assert_equal expected, actual
    actual = encryptor.row_3
    expected = ["..", ".."]
    assert_equal expected, actual
  end

  def test_excess_rows
    encryptor = Encrypt.new
    encryptor.take_input_convert_to_array("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    encryptor.translate_and_format_excess
    actual = encryptor.row_4
    expected = ["0."]
    assert_equal expected, actual
    actual = encryptor.row_5
    expected = [".."]
    assert_equal expected, actual
    actual = encryptor.row_6
    expected = [".."]
    assert_equal expected, actual
  end


end
