require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'


class InvoiceItemRepositoryTest < Minitest::Test

  attr_reader :iir

  def setup
    @iir = InvoiceItemRepository.new("./data/invoice_items.csv", "se")
  end

  def test_class_exists
    assert_instance_of InvoiceItemRepository, iir
  end

  def test_prints_all_invoice_item_instances
    result = iir.all.count

    assert_equal 21830, result
  end

  def test_find_by_id_returns_either_nil_for_invalid_match_of_invoice_item_or_instance_for_match
    result = iir.find_by_id(0000)
    actual = iir.find_by_id(1)

    assert_nil result
    refute_nil actual
  end

  def test_find_all_by_item_id_returns_empty_or_matches_depending_on_valid_match
    result = iir.find_all_by_item_id(000000)
    actual = iir.find_all_by_item_id(263519844)

    assert_equal [], result
    refute_nil actual
  end

  def test_find_all_by_invoice_id_returns_empty_or_matches_depending_on_valid_match
    result = iir.find_all_by_invoice_id(0)
    actual = iir.find_all_by_invoice_id(1)

    assert_equal [], result
    refute_nil actual
  end

end
