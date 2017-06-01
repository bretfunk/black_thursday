require_relative 'merchant'
require 'csv'
require 'pry'

class MerchantRepository
  attr_reader :input, :contents

  def initialize(csv)
    @input = CSV.open csv, headers: true, header_converters: :symbol
    merch_collection
  end
#id,name,created_at,updated_at
  def merch_collection
    @contents = @input.map do |row|
      Merchant.new({:id => row[0], :name => row[1], :created_at => row[2], :updated_at => row[3]})
    end
    @contents
  end

  #all - returns an array of all known Merchant instances
  def all
    p contents
  end

  #find_by_id - returns either nil or an instance of Merchant with a matching ID
  def find_all_by_merchant_id(merchant_id)
    #binding.pry
    @contents.select {|item| item.id == merchant_id.to_s}
  end

  #find_by_name - returns either nil or an instance of Merchant having done a case insensitive search
  # def find_by_name(name)
  #   @contents.find {|item| item.name.upcase == name.to_s.upcase}
  # end

  def find_by_name(name)
    array = []
    @contents.map do |item|
      array << item if item.name.upcase == name.to_s.upcase
    end
    array
  end

  #find_all_by_name
  def find_all_by_name(name)
    @contents.select{|item| item.name == name}
  end
end

test = MerchantRepository.new("./data/merchants.csv")
# test.find_all_by_merchant_id(12334105)
#p test.all
p test.find_by_name("vectorcoast")
