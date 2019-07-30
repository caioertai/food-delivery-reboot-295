require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  def initialize(csv_path)
    @element_class = Meal
    super(csv_path)
  end
end
