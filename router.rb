# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, orders_controller, sessions_controller)
    @meals_controller     = meals_controller
    @customers_controller = customers_controller
    @sessions_controller  = sessions_controller
    @orders_controller    = orders_controller
    @running              = true
    @employee             = nil
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "

    while @running
      # check whether the user is logged
      # @employee = @sessions_controller.log_in while @employee.nil?
      # if @employee.manager?
        # 1. user logs is and is a manager -> show manager menu
        display_manager_tasks
        action = gets.chomp.to_i
        route_manager_action(action)
      # else
      #   # 2. user logs is and is a delivery_guy -> show delivery_guy menu
      #   display_delivery_guy_tasks
      #   action = gets.chomp.to_i
      #   route_delivery_guy_action(action)
      # end
      print `clear`
    end
  end

  private

  def stop
    @running = false
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - List the customers"
    puts "4 - Create a customer"
    puts "5 - Create an order"
    puts "0 - Stop and exit the program"
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.add
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4 or 0"
    end
  end

  def display_delivery_guy_tasks
    puts ""
    puts "What do you want to do next?"
    puts "0 - Stop and exit the program"
  end

  def route_delivery_guy_action(action)
    case action
    when 0 then stop
    else
      puts "Please press 0"
    end
  end
end
