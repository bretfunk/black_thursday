require_relative 'merchant_repository'
require_relative 'item_repository'
require 'csv'
require 'simplecov'
require 'pry'

class SalesEngine
  attr_reader :items, :merchants

  def self.from_csv(files)
    @items = ItemRepository.new(files[:items])
    @merchants = MerchantRepository.new(files[:merchants])
  end
end

se = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})
mr = se.merchants
p mr.find_by_name("CJsDecor")
