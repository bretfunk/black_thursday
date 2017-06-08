
require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def setup
    @new_instance = Customer.new({
      id:           999999,
      first_name:   "Homer",
      last_name:    "Simpson",
      created_at:   Time.now,
      updated_at:   Time.now

      }, "self")
  end

  def test_class_exists
    assert_instance_of Customer, @new_instance
  end

  def test_it_returns_id
    result = @new_instance.id

    assert_equal 999999, result
  end

  def test_it_returns_first_name_of_customer
    result = @new_instance.first_name

    assert_equal "Homer", result
  end

  def test_it_returns_last_name_of_customer
    result = @new_instance.last_name

    assert_equal "Simpson", result
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
