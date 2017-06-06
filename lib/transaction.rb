require 'pry'
require 'time'


class Transaction

  attr_reader :tr, :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize(params, tr)
    @tr                          = tr
    @id                          = params[:id].to_i
    @invoice_id                  = params[:invoice_id].to_i
    @credit_card_number          = params[:credit_card_number]
    @credit_card_expiration_date = params[:credit_card_expiration_date]
    @result                      = params[:result]
    @created_at                  = params[:created_at]
    @updated_at                  = params[:updated_at]
  end

  def transaction_records
    tr.pass_to_se(id)##may need to change name
  end

  def invoice
    tr.pass_invoice_id_to_se(invoice_id)
  end

end
