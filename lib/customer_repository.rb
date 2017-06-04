require_relative 'customer'
require 'csv'
require 'pry'

class CustomerRepository
  attr_reader :input, :all, :se

  def initialize(csv, se)
    @se    = se
    @input = CSV.open csv, headers: true, header_converters: :symbol
    @all   = []
    customer_collection(input)
  end

  def customer_collection(input)
    input.map do |row|
      @all << Customer.new({:id => row[0], :first_name => row[1], :last_name => row[2], :created_at => row[3], :updated_at => row[4] }, self)
    end
  end

  def find_by_id(customer_id)
    @all.find { |customer| customer.id.to_i == customer_id.to_i}
  end

  def find_all_by_first_name(fname)
    @all.find_all { |customer| customer.first_name == fname.capitalize  }
  end

  def find_all_by_last_name(lname)
    @all.find_all { |customer| customer.last_name == lname.capitalize }
  end


###pass to se method

  def pass_to_se(id)
    @se.find_by_id(id)
  end

end
