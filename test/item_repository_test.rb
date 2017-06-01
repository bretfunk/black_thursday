require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_repository'

# require 'simplecov'



class ItemRepoTest < Minitest::Test

  def test_class_exists
    result = ItemRepository.new("./data/items.csv")

    assert_instance_of ItemRepository, result
  end

  def test_prints_all_item_contents
    new_instance = ItemRepository.new("./data/items.csv")

    result = new_instance.all

    assert_equal new_instance.contents, result
  end

  def test_finds_by_id_returns_nil_for_invalid_item
    new_instance = ItemRepository.new("./data/items.csv")

    result = new_instance.find_by_id(0000000)

    assert_equal result, nil
  end

  ##need to find out how to do
  def test_returns_valid_item_by_searching_for_id
    skip
    new_instance = ItemRepository.new("./data/items.csv")

    expected = new_instance.find_by_id(263567292)
    result   = new_instance[:id]

    assert_equal expected, result
  end

  def test_find_by_name_returns_nil_for_invalid_item
    new_instance = ItemRepository.new("./data/items.csv")

    expected = nil
    result   = new_instance.find_by_name("winzaduber")
    ##should be able to enter arguement as anything and convert to string but it's not happening
    assert_equal expected, result
  end

  ##need to find out how to do
  def test_returns_valid_item_by_searching_by_name

  end

  def test_find_all_with_description_returns_empty_array_for_invalid_match
    new_instance = ItemRepository.new("./data/items.csv")

    expected = []
    result   = new_instance.find_all_with_description("winzaduber")

    assert_equal expected, result
  end

  ##need to find out how to do
  def test_find_all_with_description_returns_item_for_valid_match

  end

  def test_find_all_by_price_returns_empty_array_for_invalid_match
    new_instance = ItemRepository.new("./data/items.csv")

    expected = []
    result   = new_instance.find_all_by_price(8675309)

    assert_equal expected, result
  end

  ##need to find out how to do
  def test_find_all_by_price_returns_item_for_valid_match

  end

  def test_find_all_by_price_in_range_returns_empty_array_for_invalid_match
    new_instance = ItemRepository.new("./data/items.csv")

    expected = []
    result   = new_instance.find_all_by_price_in_range(1..2)

    assert_equal expected, result
  end

  ##need to find out how to do
  def test_find_all_by_price_in_range_returns_valid_matches

  end

  def test_find_all_by_merchant_id_returns_empty_for_invalid_match
    new_instance = ItemRepository.new("./data/items.csv")

    expected = []
    result   = new_instance.find_all_by_merchant_id(999999)

    assert_equal expected, result
  end

  ##need to find out how to do
  def test_find_all_by_merchant_id_returns_match_for_valid_match

  end

end

