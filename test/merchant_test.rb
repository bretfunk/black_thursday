require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require 'simplecov'

class MerchantTest < Minitest::Test

  def test_that_merchant_exists
    m = Merchant.new({:id => 5, :name => "Turing School"})

    assert_instance_of m, Merchant
  end

  def test_it_returns_id_of_merchant
    m = Merchant.new({:id => 5, :name => "Turing School"})

    assert_equal 5, m.id
  end

  def test_it_returns_name_of_merchant
    m = Merchant.new({:id => 5, :name => "Turing School"})

    assert_equal "Turing School", m.name
  end

  def test_it_returns_a_time_created_at ## for item item, not needed for merchant
    time_created_at = Time.now
    m = Merchant.new({:id => 5, :name => "Turing School", :created_at => time_created_at})

    assert_equal time_created_at, m.created_at
  end
end
