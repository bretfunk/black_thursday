require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_analyst'

class SalesAnalystTest < Minitest::Test
  attr_reader :new_instance
  def setup
    @new_instance = SalesAnalyst.new
  end

  def test_class_exists
    assert_instance_of SalesAnalyst, new_instance
  end




end
