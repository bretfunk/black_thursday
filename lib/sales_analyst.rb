require 'pry'

class SalesAnalyst
  attr_reader :se

  def initialize(se)
    @se = se
  end

  def average_items_per_merchant
    (se.items.all.count.to_f / se.merchants.all.count.to_f).round(2)
  end

  def merchant_items_by_count
    array = []
    se.merchants.all.map {|merchant| array << merchant.items.count}
    array
  end

  def average_items_per_merchant_standard_devation
    total = 0
    merchant_items_by_count.map {|num| total += ((num.to_f - average_items_per_merchant.to_f) ** 2)}
    Math.sqrt(total / (se.merchants.all.count.to_f - 1.00)).round(2)
  end

  def merchants_with_high_item_count
  end

  def average_item_price_for_merchant
  end

  def average_average_price_per_merchant
  end

  def golden_items
  end
end
