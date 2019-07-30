class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(something)
    puts "What's the #{something}?"
    print "> "
    gets.chomp
  end
end
