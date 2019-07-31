class OrdersView
  def display(elements)
    elements.each do |element|
      puts "#{element.id}. #{element.name}"
    end
  end

  def ask_for(something)
    puts "What's the #{something}?"
    print "> "
    gets.chomp
  end
end
