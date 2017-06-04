require_relative 'test_helper'
require './lib/sales_engine'


class SalesEngineTest<Minitest::Test

  def test_it_exists
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    merchants = se.merchants

    assert_instance_of ItemRepository, items
    assert_instance_of MerchantRepository, merchants
  end

  def test_items_can_be_searched_by_name
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items

    assert_instance_of Item, items.find_by_name("510+ RealPush Icon Set")
  end

  def test_items_can_be_searched_by_merchant_id
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items

    assert_equal 1, items.find_all_by_merchant_id("12334141").length
  end

  def test_it_returns_empty_array_for_invalid_merchant_id
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items

    assert_equal [], items.find_all_by_merchant_id("000000")
  end

  def test_it_can_return_merchant_for_item
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})

    item = se.items.find_by_id(263395237)

    assert_equal 12334141, item.merchant_id
  end

end
