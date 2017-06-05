require 'pry'
require 'time'

class Customer

  attr_reader :cr, :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(params, cr)
    @cr         = cr
    @id         = params[:id].to_i
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
    @created_at = params[:created_at]
    @updated_at = params[:updated_at]
  end

  def customer_records
    cr.pass_to_se(id)
  end

  def merchants
    cr.merchants_pass_to_se(id)
  end

end
