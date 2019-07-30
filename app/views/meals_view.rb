class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} - $#{meal.price}"
    end
  end

  def ask_for(something)
    puts "What's the #{something}?"
    print "> "
    gets.chomp
  end
end
