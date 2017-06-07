require 'pry'
require 'time'
require 'bigdecimal'
require 'bigdecimal/util'

class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(params, iir)
    @iir        = iir
    @id         = params[:id].to_i
    @item_id    = params[:item_id].to_i
    @invoice_id = params[:invoice_id].to_i
    @quantity   = params[:quantity]
    @unit_price = (to_big_decimal(params[:unit_price].to_f) / 100) unless params[:unit_price] == nil
    @created_at = Time.parse(params[:created_at].to_s)
    @updated_at = Time.parse(params[:updated_at].to_s)
  end

  def unit_price_to_dollars
    @unit_price.to_f.round(2)
  end

  def to_big_decimal(price)
    BigDecimal.new(price, price.to_s.length)
  end



end
