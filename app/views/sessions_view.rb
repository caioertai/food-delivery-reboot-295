class SessionsView
  def ask_for(something)
    puts "What's the #{something}?"
    print "> "
    gets.chomp
  end
end
