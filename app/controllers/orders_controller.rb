require_relative '../models/order'
require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders_view = OrdersView.new
  end

  def add
    @orders_view.display(@meal_repository.all)
    # Ask for the meal of the order, get the meal from the meal repo
    meal_id = @orders_view.ask_for("meal id").to_i
    meal = @meal_repository.find(meal_id)

    @orders_view.display(@customer_repository.all)
    # Ask for the customer of the order, get the customer from the customer repo
    customer_id = @orders_view.ask_for("customer id").to_i
    customer = @customer_repository.find(customer_id)

    @orders_view.display(@employee_repository.all)
    # Ask for the delivery_guy of the order, get the delivery_guy from the employee repo
    employee_id = @orders_view.ask_for("delivery guy id").to_i
    employee = @employee_repository.find(employee_id)

    # Initialize the new order
    # Ask the order repo to store it
    @order_repository.add(Order.new(meal: meal, employee: employee, customer: customer))
  end
end
