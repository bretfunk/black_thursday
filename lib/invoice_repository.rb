require 'csv'
require_relative '../lib/invoice'

class InvoiceRepository
  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all = []
    invoice_collection(input)
  end

  def invoice_collection(input)
    input.map do |row|
    @all << Invoice.new({:id => row[0], :customer_id => row[1], :merchant_id => row[2], :status => row[3], :created_at => row[4], :updated_at => row[5]}, self)
    end

    def find_by_id
    end

    def find_all_by_customer_id
    end

    def find_all_by_merchant_id
    end

    def find_all_by_status
    end


end
