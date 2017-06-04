require_relative 'test_helper'
require_relative '../lib/merchant_repository'
#require_relative 'sales_engine'

class MerchantRepoTest < Minitest::Test

  def setup
    @new_instance = MerchantRepository.new("./data/merchants.csv", "se")
  end

  def test_class_exists
    assert_instance_of MerchantRepository, @new_instance
  end

  def test_all
    result = @new_instance.all.count
    assert_equal 475, result
  end

  def test_find_by_id
    result = @new_instance.find_by_id(12334105)
    refute_nil result
  end

  def test_fake_merch_id
    result = @new_instance.find_by_id(11111111111111)
    assert_equal nil, result
  end

  def test_find_by_name
    result = @new_instance.find_by_name("HeadyMamaCreations")
    assert_equal 12337321, result.id
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
