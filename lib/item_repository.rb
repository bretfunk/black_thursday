require_relative 'item'
require 'csv'
require 'pry'

class ItemRepository
  attr_reader :items

  def initialize(csv)
    @input = CSV.open csv, headers: true, header_converters: :symbol
  end

  def item_collection(input)
    items = @input.map do |row|
      id = row[:id]
      name = row[:name]
      description = row[:description]
      unit_price = row[:unit_price]
      merchant_id = row[:merchant_id]
    end
  end



  # def id
  #   items.each do |row|
  #     name = row[:id]
  #     p name
  #   end
  # end
  #
  # def name
  #   items.each do |row|
  #     name = row[:name]
  #     p name
  #   end
  # end
  #
  # def description
  #   items.each do |row|
  #     description = row[:description]
  #     p description
  #   end
  # end
  #
  # def unit_price
  #   items.each do |row|
  #     unit_price = row[:unit_price]
  #     p unit_price
  #   end
  # end
end

test = ItemRepository.new("./data/items.csv")
puts test.description
