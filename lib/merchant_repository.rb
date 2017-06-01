require_relative 'merchant'
require 'csv'
require 'pry'

class MerchantRepository
  attr_reader :input, :all

  def initialize(csv)
    input = CSV.open csv, headers: true, header_converters: :symbol
    @all = []
    merch_collection(input)
  end

  def merch_collection(input)
    input.map do |row|
      @all << Merchant.new(row)
    end
  end

  def find_by_id(merchant_id)
    @all.find {|merchant| merchant.id == merchant_id.to_s}
  end

  def find_by_name(name)
    @all.find {|merchant| merchant.name.upcase == name.to_s.upcase}
  end

  def find_all_by_name(name)
    @all.select{|merchant| merchant.name.upcase == name.to_s.upcase}
  end
end
