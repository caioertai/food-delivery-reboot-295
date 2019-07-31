require_relative '../models/order'
require_relative 'base_repository'

class OrderRepository < BaseRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @element_class       = Order
    @meal_repository     = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_path)
  end

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |attributes|
      attributes[:delivered] = attributes[:delivered] == "true"
      attributes[:meal]      = @meal_repository.find(attributes[:meal_id].to_i)
      attributes[:employee]  = @employee_repository.find(attributes[:employee_id].to_i)
      attributes[:customer]  = @customer_repository.find(attributes[:customer_id].to_i)
      @elements << @element_class.new(attributes)
    end
    @next_id = @elements.last.id + 1
  end
end
