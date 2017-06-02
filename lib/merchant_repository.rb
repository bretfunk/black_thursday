require_relative 'merchant'
# require_relative 'sales_engine'
require 'csv'
require 'pry'

class MerchantRepository
  attr_reader :input, :contents, :se

  def initialize(csv, se = SalesEngine)
    @se = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    merch_collection
  end

  def merch_collection
    @contents = @input.map do |row|
      Merchant.new({:id => row[0], :name => row[1], :created_at => row[2], :updated_at => row[3]}, self )
    end
    # @contents
  end

  def all
    contents
  end

  def find_by_id(merchant_id)
    array = @contents.find do |merchant|
      merchant.id == merchant_id.to_s
    end
      # array.empty? ? nil : array
  end

  def find_by_name(name)
    @contents.find {|merchant| merchant.name.upcase == name.to_s.upcase}
  end

  def find_all_by_name(name)
    @contents.select{|merchant| merchant.name.upcase == name.to_s.upcase}
  end

  def pass_to_se(id)
		@se.find_items_by_merchant_id(id)
	end


end
##
