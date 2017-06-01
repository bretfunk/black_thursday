require_relative 'merchant_repository'
require_relative 'item_repository'
require 'csv'
require 'simplecov'

class SalesEngine
  attr_reader :items

  def initialize(input_csv_files)
    @items = ItemRepository.new(input_csv_files)
    @merchants = MerchantRepository.new(input_csv_files)
  end
end

#this method isn't a class method yet
