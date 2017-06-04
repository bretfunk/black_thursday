# require 'bigdecimal'
# require 'bigdecimal/util'
require 'pry'
require 'simplecov'

class Invoice

  attr_reader :ir, :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(params, ir)
    @ir = ir
    @id = params[:id].to_i
    @customer_id = params[:customer_id].to_i
    @merchant_id = params[:merchant_id].to_i
    @status = params[:status]
    @created_at = params[:created_at]
    @updated_at = params[:updated_at]
  end

  def merchant
    ir.pass_to_se(merchant_id)
  end
end
