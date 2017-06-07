require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test

  attr_reader :i

  def setup
    @i = Invoice.new({
      id:             1,
      customer_id:    1,
      merchant_id:    12335938,
      status:         "pending",
      created_at:     "2009-02-07",
      updated_at:     "2014-03-15"
      }, "self")
  end

  def test_class_exists
    assert_instance_of Invoice, i
  end

  def test_id_exists
    result = i.id

    assert_equal 1, result
  end

  def test_customer_id_exists
    result = i.customer_id

    assert_equal 1, result
  end

  def test_merchant_id_exists
    result = i.merchant_id

    assert_equal 12335938, result
  end

  def test_status_exists
    result = i.status

    assert_equal :pending, result
  end


  def test_created_at_exists
    result = i.created_at
    date = '2009-02-07 00:00:00 -0700'

    assert_equal date, result.to_s
  end

  def test_updated_at_exists
    result = i.updated_at
    date = '2014-03-15 00:00:00 -0600'

    assert_equal date, result.to_s
  end
end
