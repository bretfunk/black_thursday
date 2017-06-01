require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'sales_analyst'
require 'csv'
# require 'simplecov'
require 'pry'

class SalesEngine
  attr_reader :items, :merchants, :sales_analyst
  def initialize(files)
    @items = ItemRepository.new(files[:items], self)
    @merchants = MerchantRepository.new(files[:merchants], self)
    @sales_analyst = SalesAnalyst.new(self)
  end

  def self.from_csv(files)
    SalesEngine.new(files)
  end
end
