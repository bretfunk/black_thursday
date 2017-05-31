require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def test_class_exists
    item  = Item.new(["name", "description", "unit_price"])

    assert_instance_of Item, item
  end

  def 


end
