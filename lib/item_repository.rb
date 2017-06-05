require_relative 'item'
require 'csv'
require 'pry'

class ItemRepository

  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all = []
    item_collection(input)
  end

  def item_collection(input)
    input.map do |row|
    @all << Item.new({:id => row[0], :name => row[1], :description => row[2], :unit_price => row[3], :merchant_id => row[4], :created_at => row[5], :updated_at => row[6]}, self)
    end
  end

  def find_by_id(item_id)
    @all.find { |item| item.id.to_i == item_id.to_i }
  end

  def find_by_name(name)
    name = name.to_s.upcase
    @all.find { |merchant| merchant.name.upcase == name }
  end

  def find_all_with_description(item_description)
    @all.find_all { |word| item_description.upcase == word.description.upcase }
  end

  def find_all_by_price(price)
    @all.find_all { |item| price.to_f == item.unit_price.to_f }
  end

  def find_all_by_price_in_range(range)
    @all.find_all { |item| item.unit_price.to_f >= range.begin.to_f && item.unit_price.to_f <= range.end.to_f }
  end

  def find_all_by_merchant_id(merch_id)
    @all.find_all { |item| item.merchant_id == merch_id.to_i }
  end

  def pass_to_se(id)
   @se.find_merchant_by_item_id(id)
  end

  # def inspect
  # "#<#{self.class} #{@merchants.size} rows>"
  # end

end
