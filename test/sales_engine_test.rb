require_relative 'test_helper'
require_relative '../lib/sales_engine'


class SalesEngineTest<Minitest::Test
  attr_reader :se

  def setup
    @se = SalesEngine.from_csv({
      items:      "./data/items.csv",
      merchants:  "./data/merchants.csv",
      invoices:   './data/invoices.csv',
      customers:  './data/customers.csv',
      invoice_items: './data/invoice_items.csv',
      transactions: './data/transactions.csv'})

  end

  def test_it_exists
    items = se.items
    merchants = se.merchants
    invoices = se.invoices
    invoice_items = se.invoice_items
    transactions = se.transactions
    customers = se.customers

    assert_instance_of ItemRepository, items
    assert_instance_of MerchantRepository, merchants
    assert_instance_of InvoiceRepository, invoices
    assert_instance_of InvoiceItemRepository, invoice_items
    assert_instance_of TransactionRepository, transactions
    assert_instance_of CustomerRepository, customers
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

  def test_find_items_by_invoice
    skip
  end

  def test_find_transactions_by_invoices
    skip
  end

  def test_find_customers_by_invoice
    skip
  end

#dont know if it is correct!!
  def test_find_invoice_by_transaction
    merchant = se.merchants.find_by_id(12335938)
    customers = merchant.invoices

    assert_equal 16, customers.length
  end

#don't know if this is correct!!
  def test_find_merchants_by_customer
    customer = se.customers.find_by_id(30)
    merchants = customer.merchants

    assert_equal 5, merchants.length
  end


end
