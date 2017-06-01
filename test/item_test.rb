require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
# require './test_data/items_fixtures'
# require 'simplecov'

class ItemTest < Minitest::Test

  def test_item_class_exists
    result = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :merchant_id => 273468
      })

    assert_instance_of Item, result
  end

  def test_it_returns_id
    id_test = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :merchant_id => 273468
      })

    result = id_test.id

    assert_equal "999999", result
  end

  def test_it_returns_name
    name_test = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :merchant_id => 273468
      })

    result  = name_test.name

    assert_equal "Pencil", result
  end

  def test_it_returns_description
    description_test = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :merchant_id => 273468
      })

    result = description_test.description

    assert_equal "You can use it to write things", result
  end

  def test_it_returns_unit_price
    unit_price_test = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => BigDecimal.new(10.99,4),
      :created_at  => Time.now,
      :updated_at  => Time.now,
      :merchant_id => 273468
      })

    result = unit_price_test.unit_price

    assert_equal 0.1099e2, result
  end

  def test_it_can_return_created_at_value
    time = Time.now
    created_at_test = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => time,
      :updated_at  => Time.now,
      :merchant_id => 273468
      })

    assert_equal created_at_test.created_at, time
  end

  def test_it_can_return_updated_at_value
    time = Time.now
    updated_at_test = Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => time,
      :merchant_id => 273468
      })

    assert_equal updated_at_test.updated_at, time
  end

  def test_it_converts_unit_price_to_float
    price_to_dollar_test =  Item.new({
      :id          => 999999,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 3,
      :created_at  => Time.now,
      :updated_at  => time,
      :merchant_id => 273468
      })

    result = price_to_dollar_test.unit_price_to_dollars

    assert_equal 3.00, result
  end

end
