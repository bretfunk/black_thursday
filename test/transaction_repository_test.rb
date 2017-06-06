require_relative 'test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  attr_reader :new_instance

  def setup
    @new_instance = TransactionRepository.new("./data/transactions.csv", "se")
  end

  def test_class_exists
    assert_instance_of TransactionRepository, @new_instance
  end

  def test_it_returns_array_of_all_known_transactions
    result = @new_instance.all.count

    assert_equal 4985, result
  end

  def test_finds_by_id_returns_nil_for_invalid_transaction
    result = @new_instance.find_by_id(000000)

    assert_nil result
  end

  def test_find_by_id_returns_transaction_for_valid_id
    result = @new_instance.find_by_id(6)

    assert_equal 4966, result.invoice_id
  end

  def test_it_returns_empty_transaction_result_by_entering_invalid_invoice_id
    result = @new_instance.find_all_by_invoice_id(00)

    assert_equal [], result
  end

  def test_it_returns_transaction_result_by_entering_valid_invoice_id
    result = @new_instance.find_all_by_invoice_id(2179)

    assert_equal Array, result.class
    assert_equal 2, result.length
    assert_equal Transaction, result.first.class
  end

  def test_it_returns_empty_result_for_invalid_credit_card_transaction
    result = @new_instance.find_all_by_credit_card_number("0000000000000000")

    assert_equal [], result
  end

  def test_it_returns_transaction_result_for_valid_credit_card_number_search
    result = @new_instance.find_all_by_credit_card_number(4848466917766329)

    assert_equal 1, result.length
  end

  def test_find_all_by_result_returns_success_transactions_specifically
    result = @new_instance.find_all_by_result("success")

    assert_equal 4158, result.length
  end

  def test_find_all_by_result_returns_failed_transactions_specifically
    result = @new_instance.find_all_by_result("failed")

    assert_equal 827, result.length
  end

  def test_find_all_by_result_returns_empty_for_invalid_transaction_result_entry
    result = @new_instance.find_all_by_result("meh")

    assert_equal 0, result.length
  end


end
