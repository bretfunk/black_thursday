require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  attr_reader :t

  def setup
    @t = Transaction.new({
      id:                           999999,
      invoice_id:                   888888,
      credit_card_number:           "5454545454545454",
      credit_card_expiration_date:  "1117",
      result:                       "success",
      created_at:                   Time.now,
      updated_at:                   Time.now
    }, "self")
  end

  def test_class_exists
    assert_instance_of Transaction, t
  end

  def test_it_returns_id
    result = t.id

    assert_equal 999999, result
  end

  def test_it_returns_invoice_id
    result = t.invoice_id

    assert_equal 888888, result
  end

  def test_it_returns_credit_card_number
    result = t.credit_card_number

    assert_equal 5454545454545454, result
  end

  def test_it_returns_credit_card_expiration_date
    result = t.credit_card_expiration_date

    assert_equal "1117", result
  end

  def test_it_returns_transaction_result
    result = t.result

    assert_equal "success", result
  end

  def test_it_can_return_created_at_value
    time = Time.now
    result = t.created_at

    refute_equal result, time
  end

  def test_it_can_return_updated_at_value
    time = Time.now
    result = t.updated_at

    refute_equal result, time
  end
end
