require_relative 'merchant'
require 'csv'
require 'pry'

class MerchantRepository
  attr_reader :input, :contents

  def initialize(csv)
    @input = CSV.open csv, headers: true, header_converters: :symbol
    merch_collection
  end

  def merch_collection
    @contents = @input.map do |row|
      Merchant.new({:id => row[0], :name => row[1], :created_at => row[2], :updated_at => row[3]})
    end
    @contents
  end

  def all
    contents
  end

  def find_all_by_merchant_id(merchant_id)
    array = []
    @contents.map do |merchant|
      array << merchant if merchant.id == merchant_id.to_s
    end
      array.empty? ? nil : array
  end

  def find_by_name(name)
    @contents.find {|merchant| merchant.name.upcase == name.to_s.upcase}
  end

  def find_all_by_name(name)
    @contents.select{|merchant| merchant.name.upcase == name.to_s.upcase}
  end
end
##
