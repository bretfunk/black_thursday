require_relative 'merchant_repository'
require_relative 'item_repository'
require 'csv'
require 'simplecov'
require 'pry'

class SalesEngine
  attr_accessor :items, :merchants
  def initialize(files)
    @items = ItemRepository.new(files[:items])
    @merchants = MerchantRepository.new(files[:merchants])
  end

  def self.from_csv(files)
    SalesEngine.new(files)
  end
end
