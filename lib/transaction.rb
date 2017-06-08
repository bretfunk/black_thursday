require 'time'

class Transaction

  attr_reader :tr,
              :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(params, tr)
    @tr                          = tr
    @id                          = params[:id].to_i
    @invoice_id                  = params[:invoice_id].to_i
    @credit_card_number          = params[:credit_card_number].to_i
    @credit_card_expiration_date = params[:credit_card_expiration_date]
    @result                      = params[:result]
    @created_at                  = Time.parse(params[:created_at].to_s)
    @updated_at                  = Time.parse(params[:updated_at].to_s)
  end

  def invoice
    tr.transaction_by_invoice(invoice_id)
  end
end
