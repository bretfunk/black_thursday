require 'pry'
require 'time'

class Customer

  attr_reader :cr,
              :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(params, cr)
    @cr         = cr
    @id         = params[:id].to_i
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
    @created_at = Time.parse(params[:created_at].to_s)
    @updated_at = Time.parse(params[:updated_at].to_s)
  end

  def merchants
    cr.merchants_by_customer(customer_id)
  end
end
