require 'pry'
require 'time'
require 'bigdecimal'
require 'bigdecimal/util'


###need to find distinction between iteration 2 invoice
class InvoiceItem

  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(params, iir)
    @iir        = iir
    @id         = params[:id].to_i
    @item_id    = params[:item_id]
    @invoice_id = params[:invoice_id]
    @quantity   = params[:quantity]
    @unit_price = (to_big_decimal(params[:unit_price].to_f) / 100) unless params[:unit_price] == nil
    @created_at = params[:created_at]
    @updated_at = params[:updated_at]
  end


  def unit_price_to_dollars
    @unit_price.to_f.round(2)
  end

  def to_big_decimal(price)
    BigDecimal.new(price, price.to_s.length)
  end

  def invoice_item_records
    irr.pass_to_se(id)
  end

end
