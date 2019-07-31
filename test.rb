require 'pry-byebug'
require_relative 'app/models/order'

require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/order_repository'

meal_repository = MealRepository.new("data/meals.csv")
employee_repository = EmployeeRepository.new("data/employees.csv")
customer_repository = CustomerRepository.new("data/customers.csv")
order_repository = OrderRepository.new("data/orders.csv", meal_repository, employee_repository, customer_repository)

meal = meal_repository.find(1)
customer = customer_repository.find(1)
employee = employee_repository.find(2)

p order_repository.all
