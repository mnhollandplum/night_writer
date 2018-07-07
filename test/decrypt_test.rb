require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/braile_dict.rb'

class DecryptTest < Minitest::Test

  def test_existence
    decrypt = Decrypt.new
    assert_instance_of Decrypt, decrypt
  end

end
