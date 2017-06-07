require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  attr_reader :cr

  def setup
    @cr = CustomerRepository.new("./data/customers.csv", "se")
  end

  def test_class_exists
    assert_instance_of CustomerRepository, cr
  end

  def test_it_returns_array_of_all_customers
    result = cr.all.count

    assert_equal 1000, result
  end

  def test_finds_by_id_returns_nil_for_invalid_customer_id
    result = cr.find_by_id(1200)

    assert_nil result
  end

  def test_find_by_id_returns_value_for_valid_customer_id
    result = cr.find_by_id(3)

    assert_equal "Mariah", result.first_name
  end

  def test_find_all_by_first_name_returns_empty_for_no_first_name_match
    result = cr.find_all_by_first_name("winzaduber")

    assert_equal [], result
  end

  def test_find_all_by_first_name_returns_name_for_first_name_match
    result = cr.find_all_by_first_name("Ramona")

    refute_nil result
  end

  def test_find_all_by_last_name_returns_empty_for_no_last_name_match
    result = cr.find_all_by_last_name("aklsjdf;alks")

    assert_equal [], result
  end

  def test_find_all_by_last_name_returns_name_for_last_name_match
    result = cr.find_all_by_last_name("nader")

    refute_nil result
  end


end
