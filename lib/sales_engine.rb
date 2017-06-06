require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'sales_analyst'
require_relative 'invoice_repository'
require_relative 'transaction_repository'
require_relative 'invoice_item_repository'
require_relative 'customer_repository'
require 'csv' #this might not be needed
require 'pry'
require 'time'

class SalesEngine
  attr_accessor :items, :merchants, :sales_analyst, :invoices, :invoice_items, :transactions, :customers

  def initialize(files)
    @items = ItemRepository.new(files[:items], self)
    @merchants = MerchantRepository.new(files[:merchants], self)
    @sales_analyst = SalesAnalyst.new(self)
    @invoices = InvoiceRepository.new(files[:invoices], self)
    @invoice_items = InvoiceItemRepository.new(files[:invoice_items], self)
    @transactions = TransactionRepository.new(files[:transactions], self)
    @customers = CustomerRepository.new(files[:customers], self)
  end

  def self.from_csv(files)
    SalesEngine.new(files)
  end

  ### working on ability to connect merchantID in ITEM  and Id in MERCHANT
  def find_merchant_by_item_id(id)
    @merchants.find_by_id(id)
  end

  def find_items_by_merchant_id(id)
    @items.find_all_by_merchant_id(id)
  end

  def find_merchant_by_invoice_id(id)
    @merchants.find_by_id(id)
  end

  def find_invoices_by_merchant_id(id)
    @invoices.find_all_by_merchant_id(id)
  end

  def find_items_by_invoice(id)
    invoice_items = @invoice_items.find_all_by_invoice_id(id)
    @items.find_items_by_invoice_id(invoice_items)
  end

  def find_transactions_by_invoice(id)
    @transactions.find_all_by_invoice_id(id)
  end

  def find_customer_by_invoice(customer_id)
    @customers.find_by_id(customer_id)
  end

  def find_invoice_by_transaction(invoice_id)
    @invoices.find_by_id(invoice_id)
  end

  def find_customers_by_merchant(merch_id)
    array = []
    merch_invoices = @invoices.find_all_by_merchant_id(merch_id)
    merch_invoices.map {|invoice| array << @customers.find_by_id(invoice.customer_id)}
    array
  end

  def find_merchants_by_customer(customer_id)
    array = []
    customer_invoices = @invoices.find_all_by_customer_id(customer_id)
    customer_invoices.map do |invoice|
      array << @merchants.find_by_id(invoice.merchant_id)
    end
    array
  end

  def is_invoice_paid?(id)
    invoice_transactions = @transactions.find_all_by_invoice_id(id)
    invoice_transactions.any? {|invoice| invoice.result == "success"}
  end

  def check_invoice_total(id)
    total_items = @invoice_items.find_all_by_invoice_id(id)
    # total_prices = total_items.map {|item| item.price}
    # total_prices.reduce(:+)
    id
  end




  # se = SalesEngine.from_csv({items: './data/items.csv', merchants: './data/merchants.csv'})
  #binding.pry

end
