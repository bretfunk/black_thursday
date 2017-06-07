require_relative 'test_helper'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :ir

  def setup
    @ir = InvoiceRepository.new("./data/invoices.csv", "se")
  end

  def test_class_exists
    assert_instance_of InvoiceRepository, ir
  end

  def test_all
    result = ir.all.count
    
    assert_equal 4985, result
  end

  def test_find_by_id
    result = ir.find_by_id(1)

    assert_equal 12335938, result.merchant_id
  end

  def test_find_all_by_customer_id
    result = ir.find_all_by_customer_id(1)

    assert_equal 8, result.length
  end

  def test_find_all_by_merchant_id
    result = ir.find_all_by_merchant_id(12335938)

    assert_equal 16, result.length
  end

  def find_all_by_status
    result = ir.find_all_by_status("pending")

    assert_equal 1473, result.length
  end

end
