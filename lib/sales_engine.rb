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
require 'bigdecimal'

class SalesEngine

  attr_accessor :items,
                :merchants,
                :sales_analyst,
                :invoices,
                :invoice_items,
                :transactions,
                :customers

  def initialize(files)
    @items          = ItemRepository.new(files[:items], self)
    @merchants      = MerchantRepository.new(files[:merchants], self)
    @sales_analyst  = SalesAnalyst.new(self)
    @invoices       = InvoiceRepository.new(files[:invoices], self)
    @invoice_items  = InvoiceItemRepository.new(files[:invoice_items], self)
    @transactions   = TransactionRepository.new(files[:transactions], self)
    @customers      = CustomerRepository.new(files[:customers], self)
  end

  def self.from_csv(files)
    SalesEngine.new(files)
  end

  def find_merchant_by_item_id(id)
    merchants.find_by_id(id)
  end

  def find_items_by_merchant_id(id)
    items.find_all_by_merchant_id(id)
  end

  def find_merchant_by_invoice_id(id)
    merchants.find_by_id(id)
  end

  def find_invoices_by_merchant_id(id)
    invoices.find_all_by_merchant_id(id)
  end

  def find_items_by_invoice(id)
    all_invoice_items = invoice_items.find_all_by_invoice_id(id)
    items.find_items_by_invoice_id(all_invoice_items)
  end

  def find_transactions_by_invoice(id)
    transactions.find_all_by_invoice_id(id)
  end

  def find_customer_by_invoice(customer_id)
    customers.find_by_id(customer_id)
  end

  def find_invoice_by_transaction(invoice_id)
    invoices.find_by_id(invoice_id)
  end

  #make this happen in repo and just call it
  def find_customers_by_merchant(merch_id)
    array = []
     merch_invoices = invoices.find_all_by_merchant_id(merch_id)
    merch_invoices.map do |invoice|
      array << customers.find_by_id(invoice.customer_id)
    end
    array.uniq
  end

  #make this happen in repo and just call it
  def find_merchants_by_customer(customer_id)
    array = []
    customer_invoices = invoices.find_all_by_customer_id(customer_id)
    customer_invoices.map do |invoice|
      array << merchants.find_by_id(invoice.merchant_id)
    end
    array
  end

  #make this happen in repo or lower and just call it
  def is_invoice_paid?(id)
    invoice_transactions = transactions.find_all_by_invoice_id(id)
    invoice_transactions.any? {|invoice| invoice.result == "success"}
  end

  #make this happen in repo or lower and just call it
  def check_invoice_total(id)
    total = 0.0
    return nil if !is_invoice_paid?(id)
    total_invoices = invoice_items.find_all_by_invoice_id(id)
    total_invoices.map do |invoice|
      total += (invoice.quantity.to_i * invoice.unit_price)
    end
    total.round(2)
  end

end
