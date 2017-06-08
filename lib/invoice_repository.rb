require_relative '../lib/invoice'
require 'csv'

class InvoiceRepository

  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se     = se
    @input  = CSV.open csv, headers: true, header_converters: :symbol
    @all    = []
    invoice_collection(input)
  end

  def invoice_collection(input)
    input.map do |row|
    @all << Invoice.new({ :id => row[0],
                          :customer_id => row[1],
                          :merchant_id => row[2],
                          :status => row[3],
                          :created_at => row[4],
                          :updated_at => row[5]}, self)
    end
  end

  def find_by_id(id)
    all.find { |invoice| invoice.id.to_i == id.to_i }
  end

  def find_all_by_customer_id(customer_id)
    all.find_all { |invoice| invoice.customer_id.to_i == customer_id.to_i }
  end

  def find_all_by_merchant_id(merch_id)
    all.find_all { |invoice| invoice.merchant_id.to_i == merch_id.to_i }
  end

  def find_all_by_status(status)
    all.find_all { |invoice| invoice.status == status.to_sym }
  end

  def merchant_by_invoice(merchant_id)
    se.find_merchant_by_invoice_id(merchant_id)
  end

  def items_by_invoice(id)
    se.find_items_by_invoice(id)
  end

  def transactions_by_invoice(invoice_id)
    se.find_transactions_by_invoice(invoice_id)
  end

  def customer_by_invoice(customer_id)
    se.find_customer_by_invoice(customer_id)
  end

  def is_invoice_paid(id)
    se.is_invoice_paid?(id)
  end

  def invoice_total(id)
    se.check_invoice_total(id)
  end

  def inspect
    "#<#{self.class} #{@all.size} rows>"
  end
end
