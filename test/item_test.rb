require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def setup
    @new_instance = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :merchant_id => 273468
      }, "self")
  end

  def test_item_class_exists
    assert_instance_of Item, @new_instance
  end

  def test_it_returns_id
    result = @new_instance.id

    assert_equal 999999, result
  end

  def test_it_returns_name
    result = @new_instance.name

    assert_equal "Pencil", result
  end

  def test_it_returns_description
    result = @new_instance.description

    assert_equal "You can use it to write things", result
  end

  def test_it_returns_unit_price
    result = @new_instance.unit_price

    assert_equal 3.0, result
  end

  def test_it_can_return_created_at_value
    time = Time.now
    result = @new_instance.created_at

    refute_equal result, time
  end

  def test_it_can_return_updated_at_value
    time = Time.now
    result = @new_instance.updated_at

    refute_equal result, time
  end

  def test_it_converts_unit_price_to_float
    result = @new_instance.unit_price_to_dollars

    assert_equal 3.00, result
  end

end
