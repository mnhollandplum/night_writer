require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_writer.rb'

class NightWriterTest < Minitest::Test

  def test_existence
    nw = NightWriter.new
    assert_instance_of NightWriter, nw
  end

  def test_it_knows_file_length
    nw = NightWriter.new
    result = nw.total_characters_in_file
    assert_equal 4, result
  end
end
