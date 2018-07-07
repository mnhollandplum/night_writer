require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/braile_dict.rb'

class BraileDictTest < Minitest::Test

  def test_existence
    bd= BraileDict.new
    assert_instance_of BraileDict, bd
  end

  def test_it_can_translate_a_letter_to_braile
    bd = BraileDict.new
    result = bd.english_to_braile["a"]
    assert_equal "0.....", result
  end

end
