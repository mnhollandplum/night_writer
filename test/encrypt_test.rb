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

  def test_it_can_convert_chars
    encryptor = Encrypt.new
    prepped = encryptor.take_input_convert_to_array("hello")
    result = encryptor.converts_per_chars(prepped)
    assert_equal [["0.","00",".."], ["0.",".0",".."], ["0.","0.","0."], ["0.","0.","0."], ["0.",".0","0."]], result
  end

  def test_it_can_take_first_row_chars
    encryptor = Encrypt.new
    expected = "0."
    actual = encryptor.dict.english_to_braile["a"][0]
    assert_equal expected, actual
  end

  def test_it_can_make_rows
    encryptor = Encrypt.new
    first = encryptor.take_input_convert_to_array("a")
    second = encryptor.converts_per_chars(first)
    third = encryptor.split_rows(second)
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

end
