require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'
require 'simplecov'

class MerchantTest < Minitest::Test

  def test_that_merchant_exists
    m = Merchant.new({:id => 5, :name => "Turing School"}, "mr")

    assert_instance_of Merchant, m
  end

  def test_it_returns_id_of_merchant
    m = Merchant.new({:id => 5, :name => "Turing School"}, "mr")

    assert_equal 5, m.id
  end

  def test_it_returns_name_of_merchant
    m = Merchant.new({:id => 5, :name => "Turing School"}, "mr")

    assert_equal "Turing School", m.name
  end
end
