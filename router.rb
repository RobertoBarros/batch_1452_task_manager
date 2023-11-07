class Router

  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_action
      action = gets.chomp.to_i
      dispatch_action(action)
    end
  end

  private

  def print_action
    puts '-' * 50
    puts "1. List all task"
    puts "2. Add task"
    puts "3. Remove task"
    puts "4. Mark task as done"
    puts '-' * 50
    puts "Enter your option:"
  end

  def dispatch_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.remove
    when 4 then @controller.mark_as_done
    end
  end
end
