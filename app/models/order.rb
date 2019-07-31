class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id        = attributes[:id].to_i
    @delivered = (attributes[:delivered] == "true" || attributes[:delivered] == true)
    @meal      = attributes[:meal]
    @customer  = attributes[:customer]
    @employee  = attributes[:employee]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_a
    [id, delivered?, meal.id, customer.id, employee.id]
  end

  def self.headers
    %w[id delivered meal_id customer_id employee_id]
  end
end
