require_relative 'test_helper'
require_relative '../lib/sales_engine'


class SalesEngineTest<Minitest::Test
  attr_reader :se

  def setup
    @se = SalesEngine.from_csv({
      items:      "./data/items.csv",
      merchants:  "./data/merchants.csv",
      invoices:   './data/invoices.csv'})
  end

  def test_it_exists
    items = se.items
    merchants = se.merchants
    invoices = se.invoices

    assert_instance_of ItemRepository, items
    assert_instance_of MerchantRepository, merchants
    assert_instance_of InvoiceRepository, invoices
  end

  def test_items_can_be_searched_by_name
    items = se.items

    assert_instance_of Item, items.find_by_name("510+ RealPush Icon Set")
  end

  def test_items_can_be_searched_by_merchant_id
    items = se.items

    assert_equal 1, items.find_all_by_merchant_id("12334141").length
  end

  def test_it_returns_empty_array_for_invalid_merchant_id
    items = se.items

    assert_equal [], items.find_all_by_merchant_id("000000")
  end

  def test_it_can_return_merchant_for_item
    item = se.items.find_by_id(263395237)

    assert_equal 12334141, item.merchant_id
  end

  def test_find_invoices_for_merchant
    merchant = se.merchants.find_by_id(12335938)
    result = merchant.invoices
    assert_equal 16, result.length
  end

  def test_find_merchant_by_invoice_id
    invoice = se.invoices.find_by_id(1)
    result = invoice.merchant
    assert_equal 12335938, result.id
  end



end
