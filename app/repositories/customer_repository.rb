require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  def initialize(csv_path)
    @element_class = Customer
    super(csv_path)
  end
end
