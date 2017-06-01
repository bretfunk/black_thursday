require_relative 'item'
require 'csv'
require 'pry'

class ItemRepository

  attr_reader  :input, :contents

  def initialize(csv)
    @input = CSV.open csv, headers: true, header_converters: :symbol
    item_collection
  end

  def item_collection
    @contents = @input.map do |row|
      Item.new({:id => row[0], :name => row[1], :description => row[2],
      :unit_price => row[3], :created_at => row[5], :updated_at => row[6],
      :merchant_id => row[4]})
    end
    @contents
  end

  def all
    p contents
  end


  def find_by_id(item_id)
    item_id = item_id.to_s
    item = nil
    @contents.map do |word|
      item = word if item_id == word.id
    end
    item
  end

  def find_by_name(name)
    name = name.to_s.upcase
    @contents.find do |word|
      word.name.upcase == name
    end
  end

  def find_all_with_description(item_description)
    # item_description = item_description.to_s
    array = []
    @contents.map do |word|
      array << word if item_description.upcase == word.description.upcase
    end
    array
  end

  def find_all_by_price(price)
    array = []
    @contents.map do |item|
      array << item if price.to_f == item.unit_price.to_f
    end
    array
  end

  def find_all_by_price_in_range(range)
    array = []
    range.to_a.map do |num|
      array << find_all_by_price(num)
    end
    array.reject { |units| units.empty? }
  end

  def find_all_by_merchant_id(merch_id)
    array = []
    merch_id = merch_id.to_s
    @contents.map do |item|
      array << item if item.merchant_id == merch_id
    end
    array
  end

end

thing = ItemRepository.new("./data/items.csv")
# puts test.contents
# puts test.find_by_id(263395237)
p thing.find_all_by_merchant_id(12334301)
