# require 'bigdecimal'
# require 'bigdecimal/util'
require 'pry'
require 'time'

class Invoice

  attr_reader :ir,
              :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(params, ir)
    @ir = ir
    @id = params[:id].to_i
    @customer_id = params[:customer_id].to_i
    @merchant_id = params[:merchant_id].to_i
    @status = params[:status].to_sym
    @created_at = Time.parse(params[:created_at])
    @updated_at = Time.parse(params[:updated_at])
  end


  def merchant
    ir.pass_to_se(merchant_id)
  end

  def items
    ir.pass_items_to_se(id)
  end

  def transactions
    ir.pass_transactions_to_se(id)
  end

  def customer
    ir.pass_customer_to_se(customer_id)
  end

  def is_paid_in_full?
    ir.pass_invoice_to_se_for_paid(id)
  end

  def total
    ir.pass_invoice_to_se_for_total(id)
  end

end
