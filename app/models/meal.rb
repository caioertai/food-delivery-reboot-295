class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id    = attributes[:id].to_i    # < Integer
    @name  = attributes[:name]
    @price = attributes[:price].to_i # < Integer
  end
end
