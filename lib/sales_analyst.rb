require 'bigdecimal'

class SalesAnalyst

  attr_reader :se

  def initialize(se)
    @se = se
  end

  def to_big_decimal(price)
    BigDecimal.new(price, price.to_s.length)
  end

  def average_items_per_merchant
    (se.all_items.count.to_f / se.all_merchants.count.to_f).round(2)
  end

  def merchant_items_by_count
    array = []
    se.all_merchants.map { |merchant| array << merchant.items.count }
    array
  end

  def average_items_per_merchant_standard_deviation
    ipm_standard_deviation
  end

  def ipm_standard_deviation
    total = 0
    merchant_items_by_count.map do |num|
      total += ((num.to_f - average_items_per_merchant.to_f)**2)
    end
    Math.sqrt(total / (se.all_merchants.count.to_f - 1.00)).round(2)
  end

  def merchants_with_high_item_count
    se.all_merchants.find_all do |merchant|
      num_to_beat = ipm_standard_deviation + average_items_per_merchant
      merchant.items.count > num_to_beat
    end
  end

  def average_item_price_for_merchant(merch_id)
    array = []
    current_merch = se.all_merchants.find { |merchant| merchant.id == merch_id }
    current_merch.items.map do |item|
      array << item.unit_price.to_f
    end
    to_big_decimal((array.reduce(:+) / array.length).round(2))
  end

  def average_average_price_per_merchant
    array = []
    se.all_merchants.map do |merchant|
      array << average_item_price_for_merchant(merchant.id)
    end
    (array.reduce(:+) / se.all_merchants.count).round(2)
  end

  def golden_items
    se.all_items.find_all do |item|
      strd_dev_multiple = (ipm_standard_deviation * 2).to_i * 1000
      num_to_beat = average_average_price_per_merchant + strd_dev_multiple
      item.unit_price >= num_to_beat
    end
  end

  def average_invoices_per_merchant
      (se.invoices.all.count.to_f / se.all_merchants.count.to_f).round(2)
  end

  def merchant_invoices_by_count
    array = []
    se.all_merchants.map { |merchant| array << merchant.invoices.count }
    array
  end

  def average_invoices_per_merchant_standard_deviation
    total = 0
    merchant_invoices_by_count.map do |num|
      total += ((num.to_f - average_invoices_per_merchant.to_f)**2)
    end
    Math.sqrt(total / (se.all_merchants.count.to_f - 1.00)).round(2)
  end

  def top_merchants_by_invoice_count
    se.all_merchants.find_all do |merchant|
      aipmsd = average_invoices_per_merchant_standard_deviation * 2
      merchant.invoices.count > average_invoices_per_merchant + aipmsd
    end
  end

  def bottom_merchants_by_invoice_count
    se.all_merchants.find_all do |merchant|
      aipmsd = average_invoices_per_merchant_standard_deviation * 2
      merchant.invoices.count < average_invoices_per_merchant - aipmsd
    end
  end

  def invoices_per_day_standard_deviation
    values = invoices_per_day_hash.values
    total = 0
    mean = values.reduce(:+) / values.length
    values.map { |num| total += ((num - mean) ** 2) }
    Math.sqrt(total / (values.length - 1.00)).round(2)
  end

  def invoices_per_day_mean
    values = invoices_per_day_hash.values
    values.reduce(:+) / values.length
  end

  def top_days_by_invoice_count
    num_to_beat = invoices_per_day_mean + invoices_per_day_standard_deviation
    most_sales = invoices_per_day_hash.select {|key, value| value > num_to_beat}
    ranked = most_sales.sort_by { |key, value| value }.reverse.flatten
    ranked.select { |item| item.class == String }
  end

  def invoices_per_day_hash
    counts = Hash.new(0)
    se.invoices.all.map do |invoice|
      day = invoice.created_at.to_s
      counts[Date.parse(day).strftime("%A")] += 1
    end
    counts
  end

  def invoice_status(status)
    statuses = se.invoices.find_all_by_status(status)
    percent = statuses.count.to_f / se.invoices.all.count.to_f * 100
    percent.round(2)
  end

  def merchants_with_only_one_item
    merchants_items = se.all_items.map { |item| item.merchant_id }
    count_hash = create_hash(merchants_items)
    merchant_ids = count_hash.select do |key, value|
      value == 1
    end.keys
    merchants_by_ids(merchant_ids)
  end

  def merchants_by_ids(ids)
    ids.map { |merchant| se.merchants.find_by_id(merchant) }
  end

  def create_hash(array)
    array.inject(Hash.new(0)) { |id, num| id[num] += 1; id }
  end
end
