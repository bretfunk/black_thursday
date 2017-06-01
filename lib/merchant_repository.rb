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

#needs to be array
  def all
    contents
  end

#needs to be nil if empty
  def find_all_by_merchant_id(merchant_id)
    @contents.select {|merchant| merchant.id == merchant_id.to_s}
  end

  def find_by_name(name)
    @contents.find {|merchant| merchant.name.upcase == name.to_s.upcase}
  end

  def find_all_by_name(name)
    @contents.select{|merchant| merchant.name.upcase == name.to_s.upcase}
  end
end
