require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :new_instance

  def setup
    @new_instance = InvoiceRepository.new("./data/invoices.csv", "se")
  end

  def test_class_exists
    assert_instance_of InvoiceRepository, @new_instance
  end

  def test_all
    result = new_instance.all.count
    assert_equal 4985, result
  end

  def test_find_by_id
    result = new_instance.find_by_id(1)
    assert_equal 12335938, result.merchant_id
  end

  def test_find_all_by_customer_id
    result = new_instance.find_all_by_customer_id(1)
    assert_equal 8, result.length
  end

  def test_find_all_by_merchant_id
    result = new_instance.find_all_by_merchant_id(12335938)
    assert_equal 16, result.length
  end

  def find_all_by_status
    result = new_instance.find_all_by_status("pending")
    assert_equal 1473, result.length
  end

end
