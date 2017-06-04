require_relative 'transaction'
require 'csv'
require 'pry'

class TransactionRepository

  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all = []
    transaction_collection(input)
  end

  def transaction_collection(input)
    input.map do |row|
      @all << Transaction.new({:id => row[0], :invoice_id => row[1], :credit_card_number => row[2], :credit_card_expiration_date => row[3], :result => row[4], :created_at => row[5], :updated_at => row[6]}), self)
    end
  end

  def find_by_id(transaction_id)
     @all.find { |transaction| }

  end

end
