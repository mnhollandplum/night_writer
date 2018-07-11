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

end
