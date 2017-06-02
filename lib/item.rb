require 'csv'
require 'bigdecimal'
# require_relative 'item_repository'
require 'pry'

class Item

  attr_reader :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id

  def initialize(params, ir = ItemRepository)
    @ir = ir
    @id = params[:id].to_s
    @name = params[:name].to_s
    @description = params[:description]
    @unit_price = params[:unit_price].to_f
    @created_at = params[:created_at]
    @updated_at = params[:updated_at]
    @merchant_id = params[:merchant_id].to_i
  end

  def unit_price_to_dollars
    @unit_price.to_f.round(2)
  end

  def merchant
    @ir.pass_to_se(merchant_id)
  end
end
