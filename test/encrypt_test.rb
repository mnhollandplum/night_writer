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
end
