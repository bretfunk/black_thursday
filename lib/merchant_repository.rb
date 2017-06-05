require_relative 'merchant'
require 'csv'
require 'pry'

class MerchantRepository

  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all = []
    merch_collection(input)
  end

  def merch_collection(input)
    input.map do |row|
      @all << Merchant.new(row, self)
    end
  end

  def find_by_id(merchant_id)
    @all.find do |merchant|
      merchant.id.to_i == merchant_id.to_i
    end
  end

  def find_by_name(name)
    @all.find { |merchant| merchant.name.upcase == name.to_s.upcase }
  end

  def find_all_by_name(name)
    @all.find_all { |merchant| merchant.name.upcase.include?(name.upcase) }
  end

  def pass_to_se(merch_id)
		@se.find_items_by_merchant_id(merch_id)
	end

  def invoices_pass_to_se(merch_id)
    @se.find_invoices_by_merchant_id(merch_id)
  end

  def customers_pass_to_se(merch_id)
    @se.find_customers_by_merchant(merch_id)
  end

  # def inspect
  # "#<#{self.class} #{@merchants.size} rows>"
  # end
end
