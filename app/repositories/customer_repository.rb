require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_path)
    @csv_path  = csv_path
    @customers = []
    @next_id   = 1
    load_csv if File.exist?(csv_path)
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv_file|
      csv_file << %w[id name address]
      @customers.each do |customer|
        csv_file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |attributes|
      @customers << Customer.new(attributes)
    end
    @next_id = @customers.last.id + 1
  end
end
