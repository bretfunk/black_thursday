require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRep < Minitest::Test
  def setup
    @new_instance = MerchantRepository.new("./data/merchants.csv")
  end

  def test_class_exists
    assert_instance_of MerchantRepository, @new_instance
  end

  def test_all
    result = @new_instance.all.count
    assert_equal 475, result
  end

  def test_find_all_by_merchant_id
    result = @new_instance.find_all_by_merchant_id(12334105)
    assert_equal 1, result.count
  end

  def test_fake_merch_id
    result = @new_instance.find_all_by_merchant_id(11111111111111)
    assert_equal nil, result
  end

  def test_find_by_name
    result = @new_instance.find_by_name("HeadyMamaCreations")
    refute_nil result
  end

  def test_fake_name
    result = @new_instance.find_by_name("Mountain Peak Survival")
    assert_nil result
  end

  def test_find_all_by_name
    result = @new_instance.find_all_by_name("LovesVariety")
    refute_nil result
  end

  def test_find_all_fake_name
    result = @new_instance.find_all_by_name("Ruby Recruiting")
    assert_equal [], result
  end
end
