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
puts test.contents
