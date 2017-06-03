require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
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
end
