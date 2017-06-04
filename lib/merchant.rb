require 'pry'
require 'simplecov'

class Merchant
  attr_reader :id, :name, :mr

  def initialize(attributes, mr)
    @id = attributes[:id].to_i
    @name = attributes[:name]
    @mr = mr
  end

  def items
    mr.pass_to_se(id)
  end

  def invoices
    mr.invoices_pass_to_se(id)
  end

end
