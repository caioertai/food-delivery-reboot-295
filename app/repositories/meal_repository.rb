require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals    = []
    @next_id  = 1
    load_csv if File.exist?(csv_path)
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv_file|
      csv_file << %w[id name price]
      @meals.each do |meal|
        csv_file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |attributes|
      @meals << Meal.new(attributes)
    end
    @next_id = @meals.last.id + 1
  end
end
