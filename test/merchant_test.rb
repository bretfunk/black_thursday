require_relative 'test_helper'
require_relative '../lib/merchant'
# require 'simplecov'

class MerchantTest < Minitest::Test

  attr_reader :new_instance

  def setup
    @new_instance = Merchant.new({:id => 5, :name => "Turing School"}, "mr")

  end

  def test_that_merchant_exists
    assert_instance_of Merchant, new_instance
  end

  def test_it_returns_id_of_merchant
    assert_equal 5, new_instance.id
  end

  def test_it_returns_name_of_merchant
    assert_equal "Turing School", new_instance.name
  end
end
