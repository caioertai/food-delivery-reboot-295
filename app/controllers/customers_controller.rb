require_relative '../models/customer'
require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @customers_view.display(customers)
  end

  def add
    name  = @customers_view.ask_for("name")
    address = @customers_view.ask_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end
end
