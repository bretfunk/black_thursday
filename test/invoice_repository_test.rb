require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :new_instance

  def setup
    @new_instance = InvoiceRepository.new("./data/invoices.csv", "se")
  end

  def test_class_exists
    assert_instance_of InvoiceRepository, @new_instance
  end

end
