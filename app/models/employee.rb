class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id       = attributes[:id].to_i
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role]
  end

  def name
    @username
  end

  def manager?
    role == 'manager'
  end

  def delivery_guy?
    role == 'delivery_guy'
  end

  def self.headers
    %w[id username password role]
  end

  def to_a
    [id, username, password, role]
  end
end
