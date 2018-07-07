require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_writer.rb'

class NightWriterTest < Minitest::Test

  def test_it_exists
    nw = Nightwriter.new
    assert_instance_of Nightwriter, nw
  end

end
