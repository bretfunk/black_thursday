require_relative 'test_helper'
require_relative '../lib/sales_analyst'
require_relative '../lib/sales_engine'

class SalesAnalystTest < Minitest::Test
  attr_reader :se, :sa
  def setup
    @se = SalesEngine.from_csv({items: './data/items.csv', merchants: './data/merchants.csv', invoices: './data/invoices.csv', invoice_items: './data/invoice_items.csv', customers: './data/customers.csv', transactions: './data/transactions.csv'})
    @sa = SalesAnalyst.new(@se)
  end

  def test_class_exists
    assert_instance_of SalesAnalyst, sa
  end

  def test_average_items_per_merchant
    actual = sa.average_items_per_merchant

    assert_equal 2.88, actual
  end

#maybe take out in case different data files
  def test_items_total
    result = se.items.all.count

    assert_equal 1367, result
  end

#maybe take out in case different data files
  def test_merchant_total
    result = se.merchants.all.count

    assert_equal 475, result
  end

  def test_average_items_per_merchant_standard_deviation
    result = sa.average_items_per_merchant_standard_deviation

    assert_equal 3.26, result
  end

  def test_all_merchant_items_by_count
    result = sa.merchant_items_by_count.reduce(:+)

    assert_equal 1367, result
  end

  def test_merchants_with_high_item_count
    skip #for time
    result = sa.merchants_with_high_item_count

    assert_equal 52, result.count
  end

  def test_average_item_price_for_merchant
    result = sa.average_item_price_for_merchant(12334135)

    assert_equal 14, result
  end

  def test_average_average_price_per_merchant
    result = sa.average_average_price_per_merchant

    assert_equal 350, result
  end

  def test_golden_items
    skip #for time
    result = sa.golden_items

    assert_equal 114, result.count
  end

  def test_average_invoices_per_merchant
    result = sa.average_invoices_per_merchant

    assert_equal 10.49, result
  end

  def test_average_invoices_per_merchant_standard_deviation
    result = sa.average_invoices_per_merchant_standard_deviation

    assert_equal 3.29, result
  end

  def test_top_merchants_by_invoice_count
    skip #for time
    result = sa.top_merchants_by_invoice_count

    assert_equal 12, result.count
  end

  def test_bottom_merchants_by_invoice_count
    skip #for time
    result = sa.bottom_merchants_by_invoice_count

    assert_equal 4, result.count
  end

  def test_invoices_per_day_hash
    result = sa.invoices_per_day_hash
    hash = {"Saturday"=>729, "Friday"=>701, "Wednesday"=>741, "Monday"=>696, "Sunday"=>708, "Tuesday"=>692, "Thursday"=>718}
    assert_equal hash, result
  end

  def test_invoices_per_day_mean
    result = sa.invoices_per_day_mean
    assert_equal 712, result
  end

  def test_invoices_per_day_standard_deviation
    result = sa.invoices_per_day_standard_deviation
    assert_equal 18.07, result
  end

  def test_top_days_by_invoice_count
    #this is different than the spec, ask someone!
    result = sa.top_days_by_invoice_count
    top_days = ["Wednesday"]
    assert_equal top_days, result
  end

  def test_invoice_status_pending
    result = sa.invoice_status(:pending)
    assert_equal 29.55, result
  end

  def test_invoice_status_shipped
    result = sa.invoice_status(:shipped)
    assert_equal 56.95, result
  end

  def test_invoice_status_returned
    result = sa.invoice_status(:returned)
    assert_equal 13.5, result
  end
end
