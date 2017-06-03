require_relative 'merchant_repository'
require_relative 'item_repository'
require 'csv' #this might not be needed
require 'simplecov'
require 'pry'

class SalesEngine
  attr_accessor :items, :merchants

  def initialize(files)
    @items = ItemRepository.new(files[:items], self )
    @merchants = MerchantRepository.new(files[:merchants], self )
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

  se = SalesEngine.from_csv({items: './data/items.csv', merchants: './data/merchants.csv'})
  binding.pry
end
