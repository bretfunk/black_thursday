require_relative 'transaction'
require 'csv'
require 'pry'

class TransactionRepository

  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se    = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all   = []
    transaction_collection(input)
  end

  def transaction_collection(input)
    input.map do |row|
      @all << Transaction.new({ :id => row[0],
                                :invoice_id => row[1],
                                :credit_card_number => row[2],
                                :credit_card_expiration_date => row[3],
                                :result => row[4],
                                :created_at => row[5],
                                :updated_at => row[6]}, self)
    end
  end

  def find_by_id(transaction_id)
     all.find { |transaction| transaction.id.to_i == transaction_id.to_i }
  end

  def find_all_by_invoice_id(inv_id)
    all.find_all { |transaction| transaction.invoice_id == inv_id }
  end

  def find_all_by_credit_card_number(card_num)
    all.find_all { |transaction| transaction.credit_card_number == card_num}
  end

  def find_all_by_result(tran_result)
    all.find_all { |transaction| transaction.result == tran_result}
  end

  def pass_invoice_id_to_se(invoice_id)
    se.find_invoice_by_transaction(invoice_id)
  end

  def inspect
    "#<#{self.class} #{@all.size} rows>"
  end

end
