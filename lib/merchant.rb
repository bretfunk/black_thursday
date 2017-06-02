require 'pry'
require_relative 'merchant_repository'

class Merchant
  attr_reader :id, :name, :mr

  def initialize(attributes, mr = MerchantRepository)
    @id = attributes[:id]
    @name = attributes[:name]
    @mr = mr
  end

  def items
    # binding.pry
    @mr.pass_to_se(id)
  end

end
