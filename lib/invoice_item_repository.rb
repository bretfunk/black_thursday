
require_relative 'invoice_item'
require 'csv'
require 'pry'

class InvoiceItemRepository

  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se    = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all   = []
    invoice_item_collection(input)
  end

  def invoice_item_collection(input)
    input.map do |row|
      @all << InvoiceItem.new({:id => row[0], :item_id => row[1], :invoice_id => row[2], :quantity => row[3], :unit_price => row[4], :created_at => row[5], :updated_at => row[6]}, self)
    end
  end

  def find_by_id(id)
    @all.find { |invoice_item| invoice_item.id.to_i == id.to_i}
  end

  def find_all_by_item_id(item_id)
    @all.find_all { |invoice_item| invoice_item.item_id == item_id}
  end

  def find_all_by_invoice_id(inv_id)
    @all.find_all { |invoice_item| invoice_item.invoice_id == inv_id }
  end

###pass to se method
  def pass_to_se(id)
    @se.find_by_id(id)
  end

  # def inspect
  #     "#<#{self.class} #{@merchants.size} rows>"
  # end

end
