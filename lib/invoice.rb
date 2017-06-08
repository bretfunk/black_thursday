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
    @ir          = ir
    @id          = params[:id].to_i
    @customer_id = params[:customer_id].to_i
    @merchant_id = params[:merchant_id].to_i
    @status      = params[:status].to_sym
    @created_at  = Time.parse(params[:created_at])
    @updated_at  = Time.parse(params[:updated_at])
  end

  def merchant
    ir.merchant_by_invoice(merchant_id)
  end

  def items
    ir.items_by_invoice(id)
  end

  def transactions
    ir.transactions_by_invoice(id)
  end

  def customer
    ir.customer_by_invoice(customer_id)
  end

  def is_paid_in_full?
    ir.is_invoice_paid(id)
  end

  def total
    ir.invoice_total(id)
  end
end
