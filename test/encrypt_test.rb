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
    encryptor.converts_per_chars
    encryptor.splits_rows
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
  encryptor = Encrypt.new("aa")
  encryptor.converts_per_chars
  encryptor.splits_rows
  actual = encryptor.row_1
  expected = ["0.0."]
  assert_equal expected, actual
  actual = encryptor.row_2
  expected = ["...."]
  assert_equal expected, actual
  actual = encryptor.row_3
  expected = ["...."]
  binding.pry
  assert_equal expected, actual
end






end
