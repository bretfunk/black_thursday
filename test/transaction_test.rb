require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  def setup
    @new_instance = Transaction.new({
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
    assert_instance_of Transaction, @new_instance
  end

  def test_it_returns_id
    result = @new_instance.id

    assert_equal 999999, result
  end

  def test_it_returns_invoice_id
    result = @new_instance.invoice_id

    assert_equal 888888, result
  end

  def test_it_returns_credit_card_number
    result = @new_instance.credit_card_number

    assert_equal 5454545454545454, result
  end

  def test_it_returns_credit_card_expiration_date
    result = @new_instance.credit_card_expiration_date

    assert_equal "1117", result
  end

  def test_it_returns_transaction_result
    result = @new_instance.result

    assert_equal "success", result
  end

  def test_it_can_return_created_at_value
    time = Time.now
    result = @new_instance.created_at

    refute_equal result, time
  end

  def test_it_can_return_updated_at_value
    time = Time.now
    result = @new_instance.updated_at

    refute_equal result, time
  end



end
