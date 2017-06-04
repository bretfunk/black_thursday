require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'sales_analyst'
require_relative 'invoice_repository'
require 'csv' #this might not be needed
# require 'simplecov'
require 'pry'

class SalesEngine
  attr_accessor :items, :merchants, :sales_analyst, :invoices

  def initialize(files)
    @items = ItemRepository.new(files[:items], self)
    @merchants = MerchantRepository.new(files[:merchants], self)
    @sales_analyst = SalesAnalyst.new(self)
    @invoices = InvoiceRepository.new(files[:invoices], self)
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
end
