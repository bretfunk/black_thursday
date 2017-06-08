
require_relative 'test_helper'
require_relative '../lib/invoice_item'


class InvoiceItemTest < Minitest::Test

  attr_reader :ii

  def setup
    @ii = InvoiceItem.new({
      id:                 999999,
      item_id:            111111,
      invoice_id:         234234,
      quantity:           34,
      unit_price:         500,
      created_at:         Time.now,
      updated_at:         Time.now,
      }, "self")
    end

  def test_invoice_item_class_exists
    assert_instance_of InvoiceItem, ii
  end

  def test_it_returns_id
    result = ii.id

    assert_equal 999999, result
  end

  def test_it_returns_item_id
    result = ii.item_id

    assert_equal 111111, result
  end

  def test_it_returns_invoice_id
    result = ii.invoice_id

    assert_equal 234234, result
  end

  def test_it_returns_quantity
    result = ii.quantity

    assert_equal 34, result
  end

  def test_it_returns_unit_price
    result = ii.unit_price

    assert_equal 0.5E1, result
  end

  def test_it_can_return_created_at_value
    time = Time.now
    result = ii.created_at

    refute_equal result, time
  end

  def test_it_can_return_updated_at_value
    time = Time.now
    result = ii.updated_at

    refute_equal result, time
  end

  def test_it_converts_unit_price_to_float
    result = ii.unit_price_to_dollars

    assert_equal 5, result
  end

end
