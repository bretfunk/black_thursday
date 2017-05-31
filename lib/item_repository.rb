require_relative 'item'
require 'csv'

class ItemRepository
  attr_reader :items

  def initialize(csv)
    @items = csv.collect { |i| Item.new(i)}
  end

  item_contents = CSV.open "./data/items.csv", headers: true, header_converters: :symbol
  item_contents.each do |row|
    id = row[:id]
    name = row[:name]
    description = row[:description]
    unit_price = row[:unit_price]
    merchant_id = row[:merchant_id]

    puts "#{id}"
    puts "#{name}"
    puts "#{description}"
    puts "#{unit_price}"
    puts "#{merchant_id}"
  end

end
