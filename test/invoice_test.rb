require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test

  attr_reader :new_instance

  def setup
    @new_instance = Invoice.new({
      id:             1,
      customer_id:    1,
      merchant_id:    12335938,
      status:         "pending",
      created_at:     2009-02-07,
      updated_at:     2014-03-15
      }, "self")
  end

  def test_class_exists
    assert_instance_of Invoice, new_instance
  end

  def test_id_exists
    result = new_instance.id

    assert_equal 1, result
  end

  def test_customer_id_exists
    result = new_instance.customer_id

    assert_equal 1, result
  end

  def test_merchant_id_exists
    result = new_instance.merchant_id

    assert_equal 12335938, result
  end

  def test_status_exists
    result = new_instance.status

    assert_equal "pending", result
  end


  def test_created_at_exists
    result = new_instance.created_at

    assert_equal 2009-02-07, result
  end

  def test_updated_at_exists
    result = new_instance.updated_at
    
    assert_equal 2014-03-15, result
  end
end
