require_relative 'test_helper'
require './lib/sales_analyst'
require './lib/sales_engine'

class SalesAnalystTest < Minitest::Test
  attr_reader :new_instance
  def setup
    @se = SalesEngine.from_csv({items: './data/items.csv', merchants: './data/merchants.csv'})
    @sa = SalesAnalyst.new(@se)
  end

  def test_class_exists
    assert_instance_of SalesAnalyst, @sa
  end

  def test_average_items_per_merchant
    actual = @sa.average_items_per_merchant

    assert_equal 2.88, actual
  end

#maybe take out in case different data files
  def test_items_total
    result = @se.items.all.count

    assert_equal 1367, result
  end

#maybe take out in case different data files
  def test_merchant_total
    result = @se.merchants.all.count

    assert_equal 475, result
  end

  def test_average_items_per_merchant_standard_deviation
    result = @sa.average_items_per_merchant_standard_devation
    assert_equal 3.26, result
  end

  def test_all_merchant_items_by_count
    result = @sa.merchant_items_by_count.reduce(:+)
    assert_equal 1367, result
  end

  def test_merchants_with_high_item_count
    skip #for time
    result = @sa.merchants_with_high_item_count
    assert_equal 52, result.count
  end

  def test_average_item_price_for_merchant
    result = @sa.average_item_price_for_merchant(12334135)
    assert_equal 14, result
  end

  def test_average_average_price_per_merchant
    result = @sa.average_average_price_per_merchant
    assert_equal 350, result
  end

  def test_golden_items
    skip #for time
    result = @sa.golden_items
    assert_equal 114, result.count
  end
end
