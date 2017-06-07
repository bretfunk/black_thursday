require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  attr_reader :i

  def setup
    @i = Item.new({
      id:         999999,
      name:        "Pencil",
      description: "You can use it to write things",
      unit_price:  300,
      created_at:  Time.now,
      updated_at:  Time.now,
      merchant_id: 273468
      }, "self")
  end

  def test_item_class_exists
    assert_instance_of Item, i
  end

  def test_it_returns_id
    result = i.id

    assert_equal 999999, result
  end

  def test_it_returns_name
    result = i.name

    assert_equal "Pencil", result
  end

  def test_it_returns_description
    result = i.description

    assert_equal "You can use it to write things", result
  end

  def test_it_returns_unit_price
    result = i.unit_price

    assert_equal 0.3e1, result
  end

  def test_it_can_return_created_at_value
    time = Time.now
    result = i.created_at

    refute_equal result, time
  end

  def test_it_can_return_updated_at_value
    time = Time.now
    result = i.updated_at

    refute_equal result, time
  end

  def test_it_converts_unit_price_to_float
    result = i.unit_price_to_dollars

    assert_equal 3, result
  end

end
