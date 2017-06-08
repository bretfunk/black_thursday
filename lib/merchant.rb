class Merchant

  attr_reader :id, :name, :mr

  def initialize(attributes, mr)
    @id   = attributes[:id].to_i
    @name = attributes[:name]
    @mr   = mr
  end

  def items
    mr.items_by_merchant(id)
  end

  def invoices
    mr.invoices_by_merchant(id)
  end

  def customers
    mr.customers_by_merchant(id)
  end
end
