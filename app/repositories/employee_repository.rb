require_relative '../models/employee'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  def initialize(csv_path)
    @element_class = Employee
    super(csv_path)
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end
end
