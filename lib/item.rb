require 'bigdecimal'
require 'bigdecimal/util'
require 'pry'
require 'time'

class Item

  attr_reader :ir,
              :id,
              :name,
              :description,
              :unit_price,
              :created_at,
              :updated_at,
              :merchant_id

  def initialize(params, ir)
    @ir          = ir
    @id          = params[:id].to_i
    @name        = params[:name]
    @description = params[:description]
    @unit_price  = (to_big_decimal(params[:unit_price].to_f) / 100)
    @created_at  = Time.parse(params[:created_at].to_s)
    @updated_at  = Time.parse(params[:updated_at].to_s)
    @merchant_id = params[:merchant_id].to_i
  end

  def unit_price_to_dollars
    unit_price.to_f.round(2)
  end

  def to_big_decimal(price)
    BigDecimal.new(price, price.to_s.length)
  end

  def merchant
    ir.merchant_by_item(merchant_id)
  end
end
